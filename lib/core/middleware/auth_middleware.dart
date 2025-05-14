import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/modules/auth/controllers/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();

    if (!authController.isLoggedIn &&
        route != '/login' &&
        route != '/register') {
      return const RouteSettings(name: '/login');
    }

    if (authController.isLoggedIn &&
        (route == '/login' || route == '/register')) {
      return const RouteSettings(name: '/home');
    }

    return null;
  }
}
