class SpellModel {

  final String spell;
  final String use;

  SpellModel({
    required this.spell,
    required this.use,
  });

  factory SpellModel.fromJson(
      Map<String, dynamic> json) {

    return SpellModel(
      spell: json['spell'] ?? '',
      use: json['use'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'spell': spell,
      'use': use,
    };
  }
}