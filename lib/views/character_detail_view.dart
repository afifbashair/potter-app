import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/character_model.dart';

class CharacterDetailView extends StatelessWidget {
  CharacterDetailView({super.key});

  final CharacterModel character =
      Get.arguments;

  Widget buildItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(
            value.isEmpty ? '-' : value,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.fullName),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Center(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(16),

                child: Image.network(
                  character.image,
                  height: 250,

                  errorBuilder:
                      (_, __, ___) =>
                          Icon(
                            Icons.person,
                            size: 120,
                          ),
                ),
              ),
            ),

            SizedBox(height: 20),

            buildItem(
              'Full Name',
              character.fullName,
            ),

            buildItem(
              'Nickname',
              character.nickname,
            ),

            buildItem(
              'House',
              character.hogwartsHouse,
            ),

            buildItem(
              'Interpreted By',
              character.interpretedBy,
            ),

            buildItem(
              'Birthdate',
              character.birthdate,
            ),
          ],
        ),
      ),
    );
  }
}