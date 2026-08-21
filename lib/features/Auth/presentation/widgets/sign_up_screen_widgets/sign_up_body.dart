import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/app_assets/app_images.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/widgets/custom_button.dart';
import 'package:aurastate/features/Auth/presentation/widgets/log_in_screen_widgets/custom_text_field.dart';
import 'package:aurastate/features/Auth/presentation/widgets/sign_up_screen_widgets/Already%20_have%20_an_account.dart';
import 'package:aurastate/features/Auth/presentation/widgets/sign_up_screen_widgets/TermsAndPrivacyCheckbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.p),
      physics: ClampingScrollPhysics(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            73.verticalSpace,
            Text(
              AppText.joinAuraEstate,
              style: AppTextStyle.playerDisplaybold32.copyWith(
                color: AppColors.primarycolor1,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Elevate your lifestyle with exclusive\nproperties.',
              style: AppTextStyle.interRegular16.copyWith(
                color: AppColors.primarycolor2,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 24.p),
              child: Align(
                alignment: AlignmentGeometry.centerStart,
                child: Text(
                  AppText.fULLNAME,
                  style: AppTextStyle.intersemibold122.copyWith(
                    color: AppColors.primarycolor1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            CustomTextField(
              controller: namecontroller,
              keyboardkey: TextInputType.text,
              text: 'John Doe',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(AppImages.person),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 24.p),
              child: Align(
                alignment: AlignmentGeometry.centerStart,
                child: Text(
                  AppText.email,
                  style: AppTextStyle.intersemibold122.copyWith(
                    color: AppColors.primarycolor1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            CustomTextField(
              controller: emailcontroller,
              keyboardkey: TextInputType.emailAddress,
              text: 'john@example.com',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(AppIcons.emailicon),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 24.p),
              child: Align(
                alignment: AlignmentGeometry.centerStart,
                child: Text(
                  AppText.phone,
                  style: AppTextStyle.intersemibold122.copyWith(
                    color: AppColors.primarycolor1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            CustomTextField(
              controller: phonecontroller,
              keyboardkey: TextInputType.phone,
              text: '+1 (555) 000-0000',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(AppIcons.phone),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 24.p),
              child: Align(
                alignment: AlignmentGeometry.centerStart,
                child: Text(
                  AppText.password,
                  style: AppTextStyle.intersemibold122.copyWith(
                    color: AppColors.primarycolor1,
                  ),
                ),
              ),
            ),
            CustomTextField(
              controller: passwordcontroller,
              keyboardkey: TextInputType.visiblePassword,
              text: AppText.passwordtext,
              prefixIcon: const Icon(Icons.lock_outline, size: 24),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 24.p),
              child: TermsAndPrivacyCheckbox(
                value: true,
                onChanged: (bool? value) {},
              ),
            ),
            SizedBox(height: 24),
            CustomButtonApp(
              text: AppText.register,
              onPressed: () {},
              borderRadius: BorderRadiusGeometry.circular(60),
            ),
            SizedBox(height: 24),
            AlreadyHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
