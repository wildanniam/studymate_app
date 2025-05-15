import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../flashcard/controllers/flashcard_controller.dart';
import '../controllers/quiz_controller.dart';
import 'package:lottie/lottie.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashcardController = Get.find<FlashcardController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Obx(() {
        if (controller.selectedDeck.value == null) {
          // Pilih deck
          if (flashcardController.decks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/lottie/empty.json', width: 180),
                  const SizedBox(height: 16),
                  const Text('Belum ada deck tersedia',
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('Pilih Deck untuk Mulai Quiz:',
                  style: TextStyle(fontSize: 18)),
              const SizedBox(height: 16),
              ...flashcardController.decks.map((deck) => Card(
                    child: ListTile(
                      title: Text(deck.title),
                      subtitle: Text(deck.description),
                      onTap: () => controller.startQuiz(deck),
                    ),
                  )),
            ],
          );
        }
        if (controller.isFinished.value) {
          // Hasil quiz
          return Center(
            child: Hero(
              tag: 'QuizResult',
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/lottie/success.json',
                        width: 120, repeat: false),
                    const SizedBox(height: 16),
                    Text('Quiz Selesai!',
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 16),
                    Text(
                        'Skor: ${controller.score.value} / ${controller.questions.length}',
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        controller.selectedDeck.value = null;
                      },
                      child: const Text('Kembali ke Pilihan Deck'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        // Tampilkan soal
        final q = controller.questions[controller.currentIndex.value];
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  'Soal ${controller.currentIndex.value + 1} / ${controller.questions.length}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Text(q['question'],
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 24),
              ...List.generate(q['options'].length, (i) {
                final opt = q['options'][i];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ElevatedButton(
                    onPressed: () => controller.answerQuestion(opt),
                    child: Text(opt),
                  ),
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}
