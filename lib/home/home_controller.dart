import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/home/home_repository.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';

class HomeController {
  // user
  // quiz

  HomeState state = HomeState.loading;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repo = HomeRepository();

  void loadUser() async {
    user = await repo.getUser();
  }

  void loadQuizzes() async {
    quizzes = await repo.getQuizzes();
  }
}
