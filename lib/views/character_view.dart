import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/character_controller.dart';
import '../controllers/login_controller.dart';

class CharacterView extends StatelessWidget {

  CharacterView({super.key});

  final controller =
      Get.put(CharacterController());

  final loginController =
      Get.put(LoginController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Characters'),

        actions: [

          IconButton(
            onPressed: () {
              Get.toNamed('/spells');
            },
            icon: Icon(Icons.auto_fix_high),
          ),

          IconButton(
            onPressed:
                loginController.logout,
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      body: Obx(() {

        if (controller.isLoading.value) {

          return Center(
            child:
                CircularProgressIndicator(),
          );
        }

        if (controller.characters.isEmpty) {

          return Center(
            child: Text('Data kosong'),
          );
        }

        return ListView.builder(

          itemCount:
              controller.characters.length,

          itemBuilder: (context, index) {

            final character =
                controller.characters[index];

            return Card(

              margin: EdgeInsets.all(10),

              child: ListTile(

                leading:
                    character.image.isNotEmpty

                    ? Image.network(
                        character.image,
                        width: 50,
                        fit: BoxFit.cover,

                        errorBuilder:
                            (_, __, ___) {

                          return Icon(
                            Icons.person,
                          );
                        },
                      )

                    : Icon(Icons.person),

                title: Text(
                  character.fullName,
                ),

                subtitle: Text(
                  character.hogwartsHouse,
                ),

                onTap: () {

                  Get.toNamed(
                    '/detail',
                    arguments: character,
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}