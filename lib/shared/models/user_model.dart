import 'dart:convert';

class UserModel {
  final String name;
  final String imageURL;
  final int score;

  UserModel({
    required this.name,
    required this.imageURL,
    required this.score,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageURL': imageURL,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      imageURL: map['imageURL'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
