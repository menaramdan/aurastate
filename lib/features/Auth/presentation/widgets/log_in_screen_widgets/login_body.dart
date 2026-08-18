import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            116.verticalSpace,
            Text(
              AppText.welcomeBack,
              style: AppTextStyle.playerDisplaybold32.copyWith(
                color: AppColors.primarycolor1,
              ),
            ),
            Text(
              'Continue your journey in luxury real\n'
              'estate and exclusive property\n'
              'management.',
              textAlign: TextAlign.center,
              style: AppTextStyle.interRegular16.copyWith(
                color: AppColors.gray2,
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 24.p),
              child: Align(
                alignment: AlignmentGeometry.centerStart,
                child: Text(
                  AppText.email,
                  style: AppTextStyle.intersemibold12.copyWith(
                    color: AppColors.primarycolor2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
