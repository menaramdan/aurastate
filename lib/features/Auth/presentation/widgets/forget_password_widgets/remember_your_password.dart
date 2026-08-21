import 'package:aurastate/core/routes/app_routes.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RememberYourPassword extends StatelessWidget {
  const RememberYourPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Remember your password? ",
        style: AppTextStyle.interRegular16.copyWith(
          color: AppColors.gray2,
          fontWeight: FontWeight.normal,
        ),
        children: [
          TextSpan(
            text: 'Login',
            style: AppTextStyle.interbold16.copyWith(
              color: AppColors.darkcolor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.push(AppRoutes.signupScreen);
              },
          ),
        ],
      ),
    );
  }
}
