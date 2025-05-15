import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../flashcard/models/flashcard_model.dart';
import '../models/quiz_history_model.dart';

class QuizController extends GetxController {
  final Rx<FlashcardDeck?> selectedDeck = Rx<FlashcardDeck?>(null);
  final RxList<Map<String, dynamic>> questions = <Map<String, dynamic>>[].obs;
  final RxInt currentIndex = 0.obs;
  final RxInt score = 0.obs;
  final RxBool isFinished = false.obs;
  late Box<QuizHistory> historyBox;

  @override
  void onInit() {
    super.onInit();
    _initHive();
  }

  Future<void> _initHive() async {
    historyBox = await Hive.openBox<QuizHistory>('quiz_history');
  }

  void startQuiz(FlashcardDeck deck) {
    selectedDeck.value = deck;
    score.value = 0;
    isFinished.value = false;
    currentIndex.value = 0;
    questions.value = _generateQuestions(deck);
  }

  List<Map<String, dynamic>> _generateQuestions(FlashcardDeck deck) {
    final cards = List<Flashcard>.from(deck.cards)..shuffle();
    return cards.map((card) {
      // Ambil 3 jawaban salah
      final wrongAnswers = deck.cards.where((c) => c.id != card.id).toList()
        ..shuffle();
      final options = [
        card.answer,
        ...wrongAnswers.take(3).map((c) => c.answer)
      ]..shuffle();
      return {
        'question': card.question,
        'options': options,
        'answer': card.answer,
      };
    }).toList();
  }

  void answerQuestion(String selected) {
    if (isFinished.value) return;
    final correct = questions[currentIndex.value]['answer'];
    if (selected == correct) score.value++;
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
    } else {
      isFinished.value = true;
      _saveHistory();
    }
  }

  void _saveHistory() {
    final deck = selectedDeck.value!;
    final history = QuizHistory(
      deckId: deck.id,
      deckTitle: deck.title,
      score: score.value,
      total: questions.length,
      date: DateTime.now(),
    );
    historyBox.add(history);
  }

  List<QuizHistory> getHistory() {
    return historyBox.values.toList().reversed.toList();
  }
}
