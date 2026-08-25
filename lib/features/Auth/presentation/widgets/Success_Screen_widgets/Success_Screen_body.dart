import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/routes/app_routes.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/widgets/custom_button.dart';
import 'package:aurastate/features/Auth/presentation/widgets/Success_Screen_widgets/success_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessScreenBody extends StatelessWidget {
  const SuccessScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.p),
      physics: ClampingScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            100.verticalSpace,

            SuccessIcon(),
            SizedBox(height: 24),
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                "Password Reset\nSuccessful",
                style: AppTextStyle.playerDisplaybold32.copyWith(
                  color: AppColors.primarycolor1,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Your security credentials have been\n"
              "updated. You can now use your new\n"
              "password to access your account.",
              style: AppTextStyle.interRegular18.copyWith(
                color: AppColors.colorofpinput,
              ),
            ),
            56.verticalSpace,
            CustomButtonApp(
              text: AppText.backToLogin,
              onPressed: () {
                context.go(AppRoutes.loginScreen);
              },
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
      ),
    );
  }
}
