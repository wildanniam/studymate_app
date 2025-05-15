import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import '../../../../core/controllers/theme_controller.dart';
import '../../auth/controllers/auth_controller.dart';

class SettingsController extends GetxController {
  final ThemeController themeController = Get.find<ThemeController>();
  final AuthController authController = Get.find<AuthController>();

  final _box = GetStorage();
  final _reminderKey = 'reminderTime';
  final Rx<TimeOfDay?> reminderTime = Rx<TimeOfDay?>(null);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    _initNotification();
    _loadReminder();
  }

  void toggleTheme() {
    themeController.toggleTheme();
  }

  void logout() {
    authController.logout();
  }

  void _loadReminder() {
    final timeStr = _box.read<String>(_reminderKey);
    if (timeStr != null) {
      final parts = timeStr.split(':');
      if (parts.length == 2) {
        reminderTime.value = TimeOfDay(
          hour: int.tryParse(parts[0]) ?? 8,
          minute: int.tryParse(parts[1]) ?? 0,
        );
      }
    }
  }

  Future<void> setReminder(TimeOfDay time) async {
    reminderTime.value = time;
    _box.write(_reminderKey, '${time.hour}:${time.minute}');
    await _scheduleDailyNotification(time);
  }

  Future<void> cancelReminder() async {
    reminderTime.value = null;
    await flutterLocalNotificationsPlugin.cancel(1);
    _box.remove(_reminderKey);
  }

  Future<void> _initNotification() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _scheduleDailyNotification(TimeOfDay time) async {
    final now = DateTime.now();
    final firstTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final scheduleTime = firstTime.isAfter(now)
        ? firstTime
        : firstTime.add(const Duration(days: 1));
    await flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      'Waktunya Belajar! 📚',
      'Ayo buka StudyMate dan lanjutkan belajarmu hari ini.',
      tz.TZDateTime.from(scheduleTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'reminder_channel',
          'Reminder Belajar',
          channelDescription: 'Notifikasi pengingat belajar harian',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
