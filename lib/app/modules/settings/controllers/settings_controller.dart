import 'package:get/get.dart';
import '../../../../core/controllers/theme_controller.dart';
import '../../auth/controllers/auth_controller.dart';

class SettingsController extends GetxController {
  final ThemeController themeController = Get.find<ThemeController>();
  final AuthController authController = Get.find<AuthController>();

  void toggleTheme() {
    themeController.toggleTheme();
  }

  void logout() {
    authController.logout();
  }
}
