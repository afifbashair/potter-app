import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/spell_controller.dart';

class FavoriteSpellView
    extends StatelessWidget {

  FavoriteSpellView({super.key});

  final controller =
      Get.put(SpellController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Favorite Spells'),
      ),

      body: GetBuilder<SpellController>(
        builder: (_) {

          final favorites =
              controller.getFavorites();

          if (favorites.isEmpty) {

            return Center(
              child:
                  Text('Belum ada favorite'),
            );
          }

          return ListView.builder(

            itemCount: favorites.length,

            itemBuilder: (context, index) {

              final spell = favorites[index];

              return Card(

                margin: EdgeInsets.all(10),

                child: ListTile(

                  title: Text(
                    spell['spell'],
                  ),

                  subtitle: Text(
                    spell['use'],
                  ),

                  trailing: IconButton(

                    onPressed: () {

                      controller.favoriteBox
                          .delete(
                        spell['spell'],
                      );

                      controller.update();

                      Get.snackbar(
                        'Favorite',
                        'Spell dihapus',
                        snackPosition:
                            SnackPosition
                                .BOTTOM,
                      );
                    },

                    icon: Icon(
                      Icons.delete,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}