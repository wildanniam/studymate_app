import 'package:hive/hive.dart';

part 'quiz_history_model.g.dart';

@HiveType(typeId: 2)
class QuizHistory extends HiveObject {
  @HiveField(0)
  String deckId;
  @HiveField(1)
  String deckTitle;
  @HiveField(2)
  int score;
  @HiveField(3)
  int total;
  @HiveField(4)
  DateTime date;

  QuizHistory({
    required this.deckId,
    required this.deckTitle,
    required this.score,
    required this.total,
    required this.date,
  });
}
