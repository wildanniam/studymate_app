import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../../core/widgets/study_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import '../../../../core/controllers/theme_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'StudyMate',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          GetBuilder<ThemeController>(
            builder: (themeController) {
              final isDark = themeController.themeMode == ThemeMode.dark;
              return Row(
                children: [
                  Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                  Switch(
                    value: isDark,
                    onChanged: (val) {
                      themeController.toggleTheme();
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, ${controller.userName}',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Obx(
                  () => GridView.count(
                    crossAxisCount: size.width > 600 ? 3 : 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: size.width > 600 ? 1.5 : 0.8,
                    children: controller.features.map((feature) {
                      return _buildFeatureCard(
                        context,
                        title: feature['title'],
                        subtitle: feature['subtitle'],
                        icon: feature['icon'],
                        onTap: () =>
                            controller.navigateToFeature(feature['route']),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    // Pilih icon edukatif untuk fitur tertentu
    IconData displayIcon = icon;
    if (title == 'Flashcard') displayIcon = FontAwesomeIcons.bookOpen;
    if (title == 'Quiz') displayIcon = FluentIcons.quiz_new_24_regular;
    return Hero(
      tag: title,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        child: StudyCard(
          title: title,
          subtitle: subtitle,
          onTap: () {
            onTap();
          },
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          backgroundColor: Theme.of(context).colorScheme.surface,
          leading: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withAlpha(30),
              shape: BoxShape.circle,
            ),
            child: Icon(
              displayIcon,
              color: Theme.of(context).colorScheme.primary,
              size: 36,
            ),
          ),
        ),
      ),
    );
  }
}
