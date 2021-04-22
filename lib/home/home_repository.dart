import 'dart:convert';

import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("database/user.json");
    return UserModel.fromJson(response);
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response = await rootBundle.loadString("database/quizzes.json");

    return (jsonDecode(response) as List)
        .map((e) => QuizModel.fromJson(e))
        .toList();
  }
}
