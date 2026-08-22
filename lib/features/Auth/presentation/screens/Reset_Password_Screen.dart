import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/features/Auth/presentation/widgets/Reset_password_widgets/ResetPasswordbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      appBar: AppBar(
        title: Text(
          AppText.resetPassword,
          style: AppTextStyle.playerDisplaysemibold24.copyWith(
            color: AppColors.primarycolor1,
          ),
        ),
        backgroundColor: Color(0xffF1F5F9),
        leadingWidth: 66.w,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset(AppIcons.arrowback),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.p),
        child: Resetpasswordbody(),
      ),
    );
  }
}
