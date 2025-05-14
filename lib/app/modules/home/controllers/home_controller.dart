import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/controllers/auth_controller.dart';

class HomeController extends GetxController {
  final AuthController _authController = Get.find<AuthController>();

  String get userName => _authController.user?.displayName?.isNotEmpty == true
      ? _authController.user!.displayName!
      : (_authController.user?.email ?? 'Pengguna');

  final RxList<Map<String, dynamic>> features = [
    {
      'title': 'Flashcard',
      'subtitle': 'Belajar dengan kartu',
      'icon': Icons.style,
      'route': '/flashcard',
    },
    {
      'title': 'Quiz',
      'subtitle': 'Uji pengetahuanmu',
      'icon': Icons.quiz,
      'route': '/quiz',
    },
    {
      'title': 'Progress',
      'subtitle': 'Lihat kemajuanmu',
      'icon': Icons.trending_up,
      'route': '/progress',
    },
    {
      'title': 'Settings',
      'subtitle': 'Pengaturan aplikasi',
      'icon': Icons.settings,
      'route': '/settings',
    },
  ].obs;

  void navigateToFeature(String route) {
    Get.toNamed(route);
  }

  void logout() {
    _authController.logout();
  }
}
