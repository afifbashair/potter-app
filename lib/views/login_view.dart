import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.username,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: controller.password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: controller.login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}