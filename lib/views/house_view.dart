import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/house_controller.dart';

class HouseView extends StatelessWidget {

  HouseView({super.key});

  final controller =
      Get.put(HouseController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Houses'),
      ),

      body: Obx(() {

        if (controller.isLoading.value) {

          return Center(
            child:
                CircularProgressIndicator(),
          );
        }

        return ListView.builder(

          itemCount:
              controller.houses.length,

          itemBuilder: (context, index) {

            final house =
                controller.houses[index];

            return Card(

              margin: EdgeInsets.all(10),

              child: ListTile(

                title: Text(
                  house.house,
                ),

                subtitle: Text(
                  'Founder: ${house.founder}',
                ),

                trailing: Text(
                  house.emoji,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),

                onTap: () {
                  controller.selectHouse(
                    house.house,
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