import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/spell_model.dart';
import '../services/api_service.dart';

class SpellController extends GetxController {

  var spells = <SpellModel>[].obs;

  var isLoading = true.obs;

  late Box favoriteBox;

  @override
  void onInit() {
    favoriteBox = Hive.box('favorites');

    fetchSpells();

    super.onInit();
  }

  void fetchSpells() async {

    try {

      isLoading(true);

      final data =
          await ApiService.getSpells();

      spells.value = List.generate(
        data.length,
        (index) =>
            SpellModel.fromJson(data[index]),
      );

    } finally {

      isLoading(false);
    }
  }

  bool isFavorite(String spellName) {
    return favoriteBox.containsKey(
      spellName,
    );
  }

  void toggleFavorite(SpellModel spell) {

    if (isFavorite(spell.spell)) {

      favoriteBox.delete(spell.spell);

      Get.snackbar(
        'Favorite',
        '${spell.spell} dihapus',
        snackPosition:
            SnackPosition.BOTTOM,
      );

    } else {

      favoriteBox.put(
        spell.spell,
        spell.toJson(),
      );

      Get.snackbar(
        'Favorite',
        '${spell.spell} ditambahkan',
        snackPosition:
            SnackPosition.BOTTOM,
      );
    }

    update();
  }

  List getFavorites() {
    return favoriteBox.values.toList();
  }
}