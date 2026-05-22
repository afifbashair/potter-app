import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/login_controller.dart';

class ProfileView extends StatefulWidget {

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() =>
      _ProfileViewState();
}

class _ProfileViewState
    extends State<ProfileView> {

  String username = '';
  String house = '';

  final loginController =
      Get.put(LoginController());

  @override
  void initState() {

    loadData();

    super.initState();
  }

  void loadData() async {

    SharedPreferences prefs =
        await SharedPreferences.getInstance();

    setState(() {

      username =
          prefs.getString('username') ?? '';

      house =
          prefs.getString(
            'selected_house',
          ) ??
          '-';
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Profile'),

        actions: [

          IconButton(
            onPressed:
                loginController.logout,
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            CircleAvatar(

              radius: 40,

              child: Text(

                username.isNotEmpty
                    ? username[0]
                        .toUpperCase()
                    : '?',

                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),

            SizedBox(height: 20),

            Text(
              username,
              style: TextStyle(
                fontSize: 22,
              ),
            ),

            SizedBox(height: 20),

            ListTile(
              title:
                  Text('Selected House'),
              subtitle: Text(house),
            ),

            ListTile(
              title:
                  Text('Kesan & Pesan'),
              subtitle: Text(
                'Praktikum TPM sangat seru dan menambah wawasan Flutter.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}