import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../quiz/controllers/quiz_controller.dart';

class ProgressView extends GetView<QuizController> {
  const ProgressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Quiz')),
      body: Obx(() {
        final history = controller.getHistory();
        if (history.isEmpty) {
          return const Center(child: Text('Belum ada riwayat quiz'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: history.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) {
            final h = history[i];
            return Card(
              child: ListTile(
                title: Text(h.deckTitle),
                subtitle:
                    Text('Skor: ${h.score}/${h.total}\n${h.date.toLocal()}'),
              ),
            );
          },
        );
      }),
    );
  }
}
