import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StudyMate'), centerTitle: true),
      body: const Center(
        child: Text(
          'Selamat Datang di StudyMate',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
