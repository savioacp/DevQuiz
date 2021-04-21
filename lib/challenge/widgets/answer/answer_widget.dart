import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String message;
  final bool isChecked;
  final bool isCorrect;

  const AnswerWidget({
    Key? key,
    required this.message,
    this.isChecked = false,
    this.isCorrect = false,
  }) : super(key: key);

  Color get _iconColor {
    if (!isChecked) return AppColors.white;
    if (isCorrect) return AppColors.darkGreen;
    return AppColors.darkRed;
  }

  Color get _backgroundColor {
    if (!isChecked) return AppColors.white;
    if (isCorrect) return AppColors.lightGreen;
    return AppColors.lightRed;
  }

  Color get _borderColor {
    if (!isChecked) return AppColors.border;
    if (isCorrect) return AppColors.green;
    return AppColors.red;
  }

  Color get _checkBorderColor {
    if (!isChecked) return AppColors.border;
    if (isCorrect) return AppColors.lightGreen;
    return AppColors.lightRed;
  }

  TextStyle get _textStyle {
    if (!isChecked) return AppTextStyles.body;
    if (isCorrect) return AppTextStyles.bodyDarkGreen;
    return AppTextStyles.bodyDarkRed;
  }

  IconData? get _icon {
    if (!isChecked) return null;
    if (isCorrect) return Icons.check;
    return Icons.close;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(color: _borderColor),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              message,
              style: _textStyle,
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: _iconColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.fromBorderSide(
                  BorderSide(color: _checkBorderColor),
                ),
              ),
              child: Icon(
                _icon,
                size: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
