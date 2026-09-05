import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/routes/app_routes.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/utils/app_validators.dart';
import 'package:aurastate/core/widgets/custom_button.dart';
import 'package:aurastate/features/Auth/presentation/widgets/log_in_screen_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class UpdatePasswordCard extends StatefulWidget {
  const UpdatePasswordCard({super.key});

  @override
  State<UpdatePasswordCard> createState() => _UpdatePasswordCardState();
}

class _UpdatePasswordCardState extends State<UpdatePasswordCard> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final bool isobsuretext = true;
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500.w),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.p, vertical: 24.p),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  AppText.nEWPASSWORD,
                  style: AppTextStyle.intersemibold122.copyWith(
                    color: AppColors.colorofpinput,
                  ),
                ),
              ),
              SizedBox(height: 6),
              CustomTextField(
                validator: AppValidators.password,
                obsuretext: isobsuretext,
                controller: passwordController,
                keyboardkey: TextInputType.visiblePassword,
                text: AppText.passwordtext,
                prefixIcon: Icon(
                  Icons.visibility_outlined,
                  color: AppColors.colorofpinput,
                ),
              ),
              24.verticalSpace,
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  AppText.cONFIRMNEWPASSWORD,
                  style: AppTextStyle.intersemibold122.copyWith(
                    color: AppColors.colorofpinput,
                  ),
                ),
              ),
              CustomTextField(
                validator: AppValidators.password,
                controller: confirmPasswordController,
                keyboardkey: TextInputType.visiblePassword,
                text: AppText.passwordtext,
                prefixIcon: Icon(
                  Icons.visibility_outlined,
                  color: AppColors.colorofpinput,
                ),
              ),
              65.verticalSpace,
              CustomButtonApp(
                text: AppText.updatePassword,
                onPressed: () {
                  context.go(AppRoutes.successScreen);
                },
                borderRadius: BorderRadius.circular(12),
                svgPicture: SvgPicture.asset(AppIcons.icon, width: 16.w),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
