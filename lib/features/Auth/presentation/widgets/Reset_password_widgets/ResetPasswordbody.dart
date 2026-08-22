import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/features/Auth/presentation/widgets/Reset_password_widgets/update_password_card.dart';
import 'package:aurastate/features/Auth/presentation/widgets/sign_up_screen_widgets/remember_password.dart';
import 'package:flutter/material.dart';

class Resetpasswordbody extends StatefulWidget {
  const Resetpasswordbody({super.key});

  @override
  State<Resetpasswordbody> createState() => _ResetpasswordbodyState();
}

class _ResetpasswordbodyState extends State<Resetpasswordbody> {
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            84.verticalSpace,
            Text(
              AppText.resetPassword,
              style: AppTextStyle.playerDisplaysemibold24.copyWith(
                color: AppColors.primarycolor1,
              ),
            ),
            Text(
              "Please choose a strong password to ensure\n"
              "your account remains secure and exclusive.",
              style: AppTextStyle.interRegular16.copyWith(
                color: AppColors.colorofpinput,
              ),
            ),
            SizedBox(height: 24),
            UpdatePasswordCard(passwordcontroller: passwordcontroller),
            24.verticalSpace,
            RememberPassword(),
          ],
        ),
      ),
    );
  }
}
