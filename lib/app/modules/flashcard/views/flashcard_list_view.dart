import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/flashcard_controller.dart';
import 'flashcard_detail_view.dart';
import 'flashcard_form_view.dart';

class FlashcardListView extends GetView<FlashcardController> {
  const FlashcardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcard Decks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Get.to(() => FlashcardFormView()),
          ),
        ],
      ),
      body: Obx(
        () => controller.decks.isEmpty
            ? const Center(
                child: Text('Belum ada deck flashcard'),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.decks.length,
                itemBuilder: (context, index) {
                  final deck = controller.decks[index];
                  return Card(
                    child: ListTile(
                      title: Text(deck.title),
                      subtitle: Text(deck.description),
                      trailing: Text('${deck.cards.length} kartu'),
                      onTap: () {
                        controller.setCurrentDeck(deck);
                        Get.to(() => const FlashcardDetailView());
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
