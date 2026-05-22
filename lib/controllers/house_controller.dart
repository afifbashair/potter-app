import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/house_model.dart';
import '../services/api_service.dart';

class HouseController extends GetxController {

  var houses = <HouseModel>[].obs;

  var isLoading = true.obs;

  @override
  void onInit() {

    fetchHouses();

    super.onInit();
  }

  void fetchHouses() async {

    try {

      isLoading(true);

      final data =
          await ApiService.getHouses();

      List<HouseModel> loaded = [];

      for (var item in data) {

        loaded.add(
          HouseModel.fromJson(item),
        );
      }

      houses.value = loaded;

    } finally {

      isLoading(false);
    }
  }

  void selectHouse(String house) async {

    SharedPreferences prefs =
        await SharedPreferences.getInstance();

    await prefs.setString(
      'selected_house',
      house,
    );

    Get.snackbar(
      'Success',
      '$house dipilih',
    );
  }
}