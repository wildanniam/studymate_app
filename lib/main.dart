import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/routes/app_pages.dart';
import 'core/theme/app_theme.dart';
import 'core/controllers/theme_controller.dart';
import 'app/modules/auth/controllers/auth_controller.dart';
import 'app/modules/flashcard/models/flashcard_model.dart';
import 'app/modules/quiz/models/quiz_history_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  await Hive.initFlutter();

  Hive.registerAdapter(FlashcardDeckAdapter());
  Hive.registerAdapter(FlashcardAdapter());
  Hive.registerAdapter(QuizHistoryAdapter());

  Get.put(ThemeController());
  Get.put(AuthController());

  runApp(const StudyMateApp());
}

class StudyMateApp extends StatelessWidget {
  const StudyMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GetMaterialApp(
          title: 'StudyMate',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeController.themeMode,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
