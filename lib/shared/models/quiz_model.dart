import 'dart:convert';

import 'package:dev_quiz/shared/models/question_model.dart';

enum Level {
  facil,
  medio,
  dificil,
  perito,
}

extension LevelExt on Level {
  static Level parse(String key) => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito,
      }[key]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String image;
  final Level level;

  QuizModel({
    this.questionsAnswered = 0,
    required this.image,
    required this.level,
    required this.title,
    required this.questions,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions?.map((x) => x.toMap())?.toList(),
      'questionsAnswered': questionsAnswered,
      'image': image,
      'level': level.toString(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionsAnswered: map['questionsAnswered'],
      image: map['image'],
      level: LevelExt.parse(map['level']),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
