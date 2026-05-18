import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../controllers/spell_controller.dart';
import '../models/spell_model.dart';

class SpellsView extends StatelessWidget {

  SpellsView({super.key});

  final controller =
      Get.put(SpellController());

  final loginController =
      Get.put(LoginController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Spells'),

        actions: [

          IconButton(
            onPressed: () {
              Get.toNamed('/favorite');
            },
            icon: Icon(Icons.favorite),
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

        return GetBuilder<SpellController>(
          builder: (_) {

            return ListView.builder(

              itemCount:
                  controller.spells.length,

              itemBuilder: (context, index) {

                SpellModel spell =
                    controller.spells[index];

                bool isFav =
                    controller.isFavorite(
                  spell.spell,
                );

                return Card(

                  margin: EdgeInsets.all(10),

                  child: ListTile(

                    title: Text(
                      spell.spell,
                    ),

                    subtitle: Text(
                      spell.use,
                    ),

                    trailing: IconButton(

                      onPressed: () {
                        controller
                            .toggleFavorite(
                          spell,
                        );
                      },

                      icon: Icon(

                        isFav
                            ? Icons.favorite
                            : Icons
                                .favorite_border,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}