import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class PasswordAndForgetPassword extends StatelessWidget {
  const PasswordAndForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 24.p),
          child: Align(
            alignment: AlignmentGeometry.centerStart,
            child: Text(
              AppText.password,
              style: AppTextStyle.intersemibold12.copyWith(
                color: AppColors.primarycolor2,
              ),
            ),
          ),
        ),

        Text(
          'Forgot Password?',
          style: AppTextStyle.interMedium12.copyWith(
            color: AppColors.primarycolor1,
          ),
        ),
      ],
    );
  }
}
