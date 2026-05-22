import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:potter_app/views/home_view.dart';

class LoginController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  void login() async {

    if (username.text.length < 5) {

      Get.snackbar(
        'Error',
        'Username minimal 5 karakter',
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    if (password.text == '123210051') {

      SharedPreferences prefs =
          await SharedPreferences.getInstance();

      await prefs.setBool('isLogin', true);

      await prefs.setString(
        'username',
        username.text,
      );

      Get.snackbar(
        'Sukses',
        'Login berhasil',
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offAllNamed('/home');

    } else {

      Get.snackbar(
        'Error',
        'Password salah',
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