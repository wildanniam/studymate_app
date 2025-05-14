import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import '../models/flashcard_model.dart';

class FlashcardController extends GetxController {
  late Box<FlashcardDeck> deckBox;
  final RxList<FlashcardDeck> decks = <FlashcardDeck>[].obs;
  final Rx<FlashcardDeck?> currentDeck = Rx<FlashcardDeck?>(null);
  final RxInt currentCardIndex = 0.obs;
  final RxBool isFlipped = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initHive();
  }

  Future<void> _initHive() async {
    deckBox = await Hive.openBox<FlashcardDeck>('decks');
    _loadDecks();
  }

  void _loadDecks() {
    decks.value = deckBox.values.toList();
  }

  Future<void> createDeck(String title, String description) async {
    final deck = FlashcardDeck(
      id: const Uuid().v4(),
      title: title,
      description: description,
      createdAt: DateTime.now(),
    );
    await deckBox.put(deck.id, deck);
    _loadDecks();
  }

  Future<void> updateDeck(FlashcardDeck deck) async {
    await deckBox.put(deck.id, deck);
    _loadDecks();
  }

  Future<void> deleteDeck(String deckId) async {
    await deckBox.delete(deckId);
    _loadDecks();
  }

  void setCurrentDeck(FlashcardDeck deck) {
    currentDeck.value = deck;
    currentCardIndex.value = 0;
    isFlipped.value = false;
  }

  Future<void> addCard(String question, String answer) async {
    if (currentDeck.value == null) return;

    final card = Flashcard(
      id: const Uuid().v4(),
      question: question,
      answer: answer,
      lastReviewed: DateTime.now(),
    );

    currentDeck.value!.cards.add(card);
    await updateDeck(currentDeck.value!);
  }

  Future<void> updateCard(Flashcard card) async {
    if (currentDeck.value == null) return;

    final index = currentDeck.value!.cards.indexWhere((c) => c.id == card.id);
    if (index != -1) {
      currentDeck.value!.cards[index] = card;
      await updateDeck(currentDeck.value!);
    }
  }

  Future<void> deleteCard(String cardId) async {
    if (currentDeck.value == null) return;

    currentDeck.value!.cards.removeWhere((card) => card.id == cardId);
    await updateDeck(currentDeck.value!);
  }

  void toggleCard() {
    isFlipped.value = !isFlipped.value;
  }

  void nextCard() {
    if (currentDeck.value == null) return;
    if (currentCardIndex.value < currentDeck.value!.cards.length - 1) {
      currentCardIndex.value++;
      isFlipped.value = false;
    }
  }

  void previousCard() {
    if (currentCardIndex.value > 0) {
      currentCardIndex.value--;
      isFlipped.value = false;
    }
  }

  void markAsMastered() {
    if (currentDeck.value == null) return;
    final card = currentDeck.value!.cards[currentCardIndex.value];
    card.isMastered = true;
    card.lastReviewed = DateTime.now();
    updateCard(card);
  }
}
