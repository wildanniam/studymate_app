import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../flashcard/models/flashcard_model.dart';
import '../../quiz/models/quiz_history_model.dart';

class ProgressController extends GetxController {
  Box<FlashcardDeck>? deckBox;
  Box<QuizHistory>? quizBox;

  final RxInt masteredCount = 0.obs;
  final RxList<QuizHistory> quizHistory = <QuizHistory>[].obs;
  final RxMap<DateTime, int> weeklyStudy = <DateTime, int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _initHive();
  }

  Future<void> _initHive() async {
    deckBox = await Hive.openBox<FlashcardDeck>('decks');
    quizBox = await Hive.openBox<QuizHistory>('quiz_history');
    _loadData();
  }

  void _loadData() {
    // Hitung jumlah flashcard mastered
    int mastered = 0;
    if (deckBox != null) {
      for (var deck in deckBox!.values) {
        mastered += deck.cards.where((c) => c.isMastered).length;
      }
    }
    masteredCount.value = mastered;

    // Ambil quiz history
    quizHistory.value = quizBox?.values.toList().reversed.toList() ?? [];

    // Hitung aktivitas belajar mingguan (jumlah quiz per hari)
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    Map<DateTime, int> weekMap = {};
    for (int i = 0; i < 7; i++) {
      final day =
          DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day + i);
      weekMap[day] = 0;
    }
    if (quizBox != null) {
      for (var q in quizBox!.values) {
        final d = DateTime(q.date.year, q.date.month, q.date.day);
        if (d.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
            d.isBefore(endOfWeek.add(const Duration(days: 1)))) {
          weekMap[d] = (weekMap[d] ?? 0) + 1;
        }
      }
    }
    weeklyStudy.value = weekMap;
  }
}
