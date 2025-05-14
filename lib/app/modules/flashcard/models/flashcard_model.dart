import 'package:hive/hive.dart';

part 'flashcard_model.g.dart';

@HiveType(typeId: 0)
class FlashcardDeck extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  DateTime createdAt;

  @HiveField(4)
  List<Flashcard> cards;

  FlashcardDeck({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    List<Flashcard>? cards,
  }) : cards = cards ?? [];
}

@HiveType(typeId: 1)
class Flashcard extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String question;

  @HiveField(2)
  String answer;

  @HiveField(3)
  bool isMastered;

  @HiveField(4)
  DateTime lastReviewed;

  Flashcard({
    required this.id,
    required this.question,
    required this.answer,
    this.isMastered = false,
    required this.lastReviewed,
  });
}
