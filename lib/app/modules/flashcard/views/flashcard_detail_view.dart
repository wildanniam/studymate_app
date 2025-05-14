import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../controllers/flashcard_controller.dart';
import 'flashcard_form_view.dart';

class FlashcardDetailView extends GetView<FlashcardController> {
  const FlashcardDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.currentDeck.value?.title ?? '')),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Get.to(() => FlashcardFormView(isCardForm: true)),
          ),
        ],
      ),
      body: Obx(() {
        final deck = controller.currentDeck.value;
        if (deck == null) {
          return const Center(
            child: Text('Deck tidak ditemukan'),
          );
        }

        if (deck.cards.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum ada kartu dalam deck ini'),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () =>
                      Get.to(() => FlashcardFormView(isCardForm: true)),
                  icon: const Icon(Icons.add),
                  label: const Text('Tambah Kartu'),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: CardSwiper(
                cardsCount: deck.cards.length,
                numberOfCardsDisplayed: 1,
                onSwipe: (previousIndex, currentIndex, direction) {
                  controller.currentCardIndex.value = currentIndex ?? 0;
                  controller.isFlipped.value = false;
                  return true;
                },
                cardBuilder: (context, index, horizontalOffsetPercentage,
                    verticalOffsetPercentage) {
                  if (index < 0 || index >= deck.cards.length) return null;
                  final card = deck.cards[index];
                  return GestureDetector(
                    onTap: controller.toggleCard,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: Obx(() => Text(
                                controller.isFlipped.value
                                    ? card.answer
                                    : card.question,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: controller.previousCard,
                  ),
                  Obx(() => Text(
                        '${controller.currentCardIndex.value + 1}/${deck.cards.length}',
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: controller.nextCard,
                  ),
                  Obx(() {
                    final card = deck.cards[controller.currentCardIndex.value];
                    return IconButton(
                      icon: Icon(
                        card.isMastered
                            ? Icons.check_circle
                            : Icons.check_circle_outline,
                        color: card.isMastered ? Colors.green : null,
                      ),
                      onPressed: controller.markAsMastered,
                    );
                  }),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
