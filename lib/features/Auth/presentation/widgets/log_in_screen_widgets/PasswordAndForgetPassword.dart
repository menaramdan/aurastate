import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/routes/app_routes.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordAndForgetPassword extends StatelessWidget {
  const PasswordAndForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            AppText.password,
            style: AppTextStyle.intersemibold12.copyWith(
              color: AppColors.primarycolor2,
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            context.push(AppRoutes.forgetpassword);
          },
          child: Text(
            'Forgot Password?',
            style: AppTextStyle.interMedium12.copyWith(
              color: AppColors.primarycolor1,
            ),
          ),
        ),
      ],
    );
  }
}
