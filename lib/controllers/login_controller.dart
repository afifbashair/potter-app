import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  void login() async {
    if (username.text == 'admin' &&
        password.text == '123') {

      SharedPreferences prefs =
          await SharedPreferences.getInstance();

      await prefs.setBool('isLogin', true);

      Get.snackbar(
        'Sukses',
        'Login berhasil',
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offAllNamed('/characters');
    } else {
      Get.snackbar(
        'Gagal',
        'Username/password salah',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void logout() async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance();

    await prefs.clear();

    Get.offAllNamed('/login');

    Get.snackbar(
      'Logout',
      'Berhasil logout',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}