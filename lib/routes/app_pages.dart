import 'package:get/get.dart';

import '../views/login_view.dart';
import '../views/character_view.dart';
import '../views/character_detail_view.dart';
import '../views/spells_view.dart';
import '../views/favorite_spell_view.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/login', page: () => LoginView()),
    GetPage(name: '/characters', page: () => CharacterView()),
    GetPage(name: '/detail', page: () => CharacterDetailView()),
    GetPage(name: '/spells', page: () => SpellsView()),
    GetPage(name: '/favorite', page: () => FavoriteSpellView()),
  ];
}