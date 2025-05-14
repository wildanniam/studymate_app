import 'package:get/get.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/flashcard/views/flashcard_list_view.dart';
import '../modules/flashcard/views/flashcard_detail_view.dart';
import '../modules/flashcard/views/flashcard_form_view.dart';
import '../modules/flashcard/bindings/flashcard_binding.dart';
import '../modules/quiz/views/quiz_view.dart';
import '../modules/progress/views/progress_view.dart';
import '../modules/settings/views/settings_view.dart';
import '../../core/middleware/auth_middleware.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterView(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.flashcard,
      page: () => const FlashcardListView(),
      binding: FlashcardBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.flashcardDetail,
      page: () => const FlashcardDetailView(),
      binding: FlashcardBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.flashcardForm,
      page: () => FlashcardFormView(),
      binding: FlashcardBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.quiz,
      page: () => const QuizView(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.progress,
      page: () => const ProgressView(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsView(),
      middlewares: [AuthMiddleware()],
    ),
  ];
}
