import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/utils/app_validators.dart';
import 'package:aurastate/core/widgets/custom_button.dart';
import 'package:aurastate/features/Auth/presentation/widgets/log_in_screen_widgets/PasswordAndForgetPassword.dart';
import 'package:aurastate/features/Auth/presentation/widgets/log_in_screen_widgets/asking_for_account.dart';
import 'package:aurastate/features/Auth/presentation/widgets/log_in_screen_widgets/custom_text_field.dart';
import 'package:aurastate/features/Auth/presentation/widgets/log_in_screen_widgets/social_media_buttons.dart';
import 'package:aurastate/features/Auth/presentation/widgets/log_in_screen_widgets/text_driver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool isPasswordVisible = false;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.p),
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
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    AppText.email,
                    style: AppTextStyle.intersemibold12.copyWith(
                      color: AppColors.primarycolor2,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                CustomTextField(
                  validator: AppValidators.email,
                  controller: emailcontroller,
                  keyboardkey: TextInputType.emailAddress,
                  text: AppText.emailaddress,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(AppIcons.emailicon),
                  ),
                ),
                SizedBox(height: 16),
                PasswordAndForgetPassword(),
                CustomTextField(
                  obsuretext: isPasswordVisible,
                  validator: AppValidators.password,
                  controller: passwordcontroller,
                  keyboardkey: TextInputType.visiblePassword,
                  text: AppText.passwordtext,
                  prefixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: Icon(
                      isPasswordVisible
                          ? Icons.lock_open_outlined
                          : Icons.lock_outline,
                      size: 24.w,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                CustomButtonApp(
                  text: AppText.login,
                  onPressed: () {},
                  borderRadius: BorderRadiusGeometry.circular(60),
                ),
                SizedBox(height: 24),
                TextDriver(),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButtons(
                      icon: SvgPicture.asset(AppIcons.googleicon),
                      text: AppText.google,
                    ),
                    SizedBox(width: 16),
                    SocialMediaButtons(
                      icon: SvgPicture.asset(AppIcons.facebookicon),
                      text: AppText.facebook,
                    ),
                  ],
                ),

                SizedBox(height: 24),
                AskingForAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
