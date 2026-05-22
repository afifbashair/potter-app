class HouseModel {

  final String house;
  final String founder;
  final String emoji;

  HouseModel({
    required this.house,
    required this.founder,
    required this.emoji,
  });

  factory HouseModel.fromJson(
      Map<String, dynamic> json) {

    return HouseModel(

      house:
          json['house']?.toString() ?? '',

      founder:
          json['founder']?.toString() ?? '',

      emoji:
          json['emoji']?.toString() ?? '',
    );
  }
}