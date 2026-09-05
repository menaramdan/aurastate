import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/app_assets/app_images.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/utils/app_validators.dart';
import 'package:aurastate/features/Auth/presentation/widgets/log_in_screen_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignupFields extends StatefulWidget {
  const SignupFields({
    super.key,
    required this.namecontroller,
    required this.emailcontroller,
    required this.phonecontroller,
    required this.passwordcontroller,
  });

  final TextEditingController namecontroller;
  final TextEditingController emailcontroller;
  final TextEditingController phonecontroller;
  final TextEditingController passwordcontroller;

  @override
  State<SignupFields> createState() => _SignupFieldsState();
}

class _SignupFieldsState extends State<SignupFields> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          validator: AppValidators.name,
          controller: widget.namecontroller,
          keyboardkey: TextInputType.text,
          text: 'John Doe',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(AppImages.person),
          ),
        ),

        SizedBox(height: 16),

        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            AppText.email,
            style: AppTextStyle.intersemibold122.copyWith(
              color: AppColors.primarycolor1,
            ),
          ),
        ),

        SizedBox(height: 4),

        CustomTextField(
          validator: AppValidators.email,
          controller: widget.emailcontroller,
          keyboardkey: TextInputType.emailAddress,
          text: 'john@example.com',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(AppIcons.emailicon),
          ),
        ),

        SizedBox(height: 16),

        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            AppText.phone,
            style: AppTextStyle.intersemibold122.copyWith(
              color: AppColors.primarycolor1,
            ),
          ),
        ),

        SizedBox(height: 4),

        CustomTextField(
          validator: AppValidators.phone,
          controller: widget.phonecontroller,
          keyboardkey: TextInputType.phone,
          text: '+1 (555) 000-0000',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(AppIcons.phone),
          ),
        ),

        SizedBox(height: 16),

        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            AppText.password,
            style: AppTextStyle.intersemibold122.copyWith(
              color: AppColors.primarycolor1,
            ),
          ),
        ),

        SizedBox(height: 4),

        CustomTextField(
          obsuretext: !isPasswordVisible,
          validator: AppValidators.password,
          controller: widget.passwordcontroller,
          keyboardkey: TextInputType.visiblePassword,
          text: AppText.passwordtext,
          prefixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            child: Icon(
              isPasswordVisible ? Icons.lock_open_outlined : Icons.lock_outline,
              size: 24.w,
            ),
          ),
        ),
      ],
    );
  }
}
