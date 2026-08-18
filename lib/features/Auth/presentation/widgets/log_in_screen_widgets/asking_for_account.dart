import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AskingForAccount extends StatelessWidget {
  const AskingForAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Don't have an account? ",
        style: AppTextStyle.interRegular16.copyWith(
          color: AppColors.gray2,
          fontWeight: FontWeight.normal,
        ),
        children: [
          TextSpan(
            text: 'Register Now',
            style: AppTextStyle.interRegular14.copyWith(
              color: AppColors.darkcolor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
