import 'package:get/get.dart';

import '../models/character_model.dart';
import '../services/api_service.dart';

class CharacterController extends GetxController {

  var characters = <CharacterModel>[].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCharacters();
    super.onInit();
  }

  void fetchCharacters() async {

    try {

      isLoading(true);

      final data =
          await ApiService.getCharacters();

      print(data);

      List<CharacterModel> loadedData = [];

      for (var item in data) {

        loadedData.add(
          CharacterModel.fromJson(item),
        );
      }

      characters.value = loadedData;

      print(characters.length);

    } catch (e) {

      print("ERROR CHARACTER:");
      print(e);

      Get.snackbar(
        'Error',
        e.toString(),
      );

    } finally {

      isLoading(false);
    }
  }
}