import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;

  const QuizCardWidget({Key? key, required this.quiz}) : super(key: key);

  String get _progressString =>
      "${quiz.questionsAnswered} de ${quiz.questions.length}";
  double get _progressValue => quiz.questionsAnswered / quiz.questions.length;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(quiz.image),
          ),
          SizedBox(height: 24),
          Text(
            quiz.title,
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Text(
                _progressString,
                style: AppTextStyles.body11,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: ProgressIndicatorWidget(
                  value: _progressValue,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
