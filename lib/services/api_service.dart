import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {

  static Future getCharacters() async {
    final response = await http.get(
      Uri.parse(
        'https://potterapi-fedeperin.vercel.app/en/characters',
      ),
    );

    return jsonDecode(response.body);
  }

  static Future getSpells() async {
    final response = await http.get(
      Uri.parse(
        'https://potterapi-fedeperin.vercel.app/en/spells',
      ),
    );

    return jsonDecode(response.body);
  }

  static Future getHouses() async {

  final response = await http.get(
      Uri.parse(
        'https://potterapi-fedeperin.vercel.app/en/houses',
      ),
    );

    return jsonDecode(response.body);
  }
}