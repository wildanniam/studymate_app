import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = controller.authController.user;
    final isDark = controller.themeController.themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // User Info
          if (user != null) ...[
            Center(
              child: CircleAvatar(
                radius: 36,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: user.photoURL != null
                    ? ClipOval(
                        child: Image.network(user.photoURL!,
                            width: 64, height: 64, fit: BoxFit.cover),
                      )
                    : Text(
                        (user.displayName?.isNotEmpty == true
                                ? user.displayName![0]
                                : user.email?[0] ?? '?')
                            .toUpperCase(),
                        style:
                            const TextStyle(fontSize: 32, color: Colors.white),
                      ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                user.displayName?.isNotEmpty == true ? user.displayName! : '-',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Center(
              child: Text(
                user.email ?? '-',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 24),
          ],
          // Status login
          ListTile(
            leading: Icon(Icons.verified_user,
                color: Theme.of(context).colorScheme.primary),
            title: const Text('Status Login'),
            subtitle: Text(user != null ? 'Aktif' : 'Tidak Aktif'),
          ),
          // Theme mode
          ListTile(
            leading: Icon(isDark ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).colorScheme.primary),
            title: const Text('Mode Tema'),
            subtitle: Text(isDark ? 'Dark' : 'Light'),
            trailing: Switch(
              value: isDark,
              onChanged: (val) => controller.toggleTheme(),
            ),
          ),
          // Versi aplikasi
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Versi Aplikasi'),
            subtitle: Text('1.0.0'),
          ),
          const SizedBox(height: 32),
          // Logout
          ElevatedButton.icon(
            onPressed: controller.logout,
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}
