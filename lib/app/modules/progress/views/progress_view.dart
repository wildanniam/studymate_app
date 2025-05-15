import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controllers/progress_controller.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProgressController>(
      init: ProgressController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text('Progress Belajar')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Card: Jumlah Flashcard Mastered
                Card(
                  color: Theme.of(context).colorScheme.primary.withAlpha(30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text('Flashcard Dipahami',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Obx(() => Text(
                              '${controller.masteredCount.value}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Card: Grafik Quiz Terakhir (Syncfusion)
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Grafik Skor Quiz Terakhir',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 12),
                        Obx(() {
                          final data = controller.quizHistory
                              .take(5)
                              .toList()
                              .reversed
                              .toList();
                          if (data.isEmpty) {
                            return const Text('Belum ada data quiz');
                          }
                          final chartData = data
                              .asMap()
                              .entries
                              .map((e) => QuizChartData(
                                    'Quiz ${e.key + 1}',
                                    e.value.score,
                                    e.value.total,
                                  ))
                              .toList();
                          return SizedBox(
                            height: 200,
                            child: SfCartesianChart(
                              primaryXAxis: const CategoryAxis(),
                              series: <ColumnSeries<QuizChartData, String>>[
                                ColumnSeries<QuizChartData, String>(
                                  dataSource: chartData,
                                  xValueMapper: (QuizChartData q, _) => q.label,
                                  yValueMapper: (QuizChartData q, _) => q.score,
                                  dataLabelSettings:
                                      const DataLabelSettings(isVisible: true),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Card: Kalender Mingguan
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kalender Belajar Mingguan',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 12),
                        Obx(() {
                          final week = controller.weeklyStudy;
                          if (week.isEmpty) {
                            return const Text('Belum ada aktivitas minggu ini');
                          }
                          final days = week.keys.toList()
                            ..sort((a, b) => a.weekday.compareTo(b.weekday));
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: days.map((d) {
                              final isActive = (week[d] ?? 0) > 0;
                              return Column(
                                children: [
                                  Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Theme.of(context)
                                              .colorScheme
                                              .surfaceContainerHighest,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        _dayShort(d.weekday),
                                        style: TextStyle(
                                          color: isActive
                                              ? Colors.white
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .onSurface,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text('${week[d]}x',
                                      style: const TextStyle(fontSize: 12)),
                                ],
                              );
                            }).toList(),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

String _dayShort(int weekday) {
  const days = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
  return days[(weekday - 1) % 7];
}

class QuizChartData {
  final String label;
  final int score;
  final int total;
  QuizChartData(this.label, this.score, this.total);
}
