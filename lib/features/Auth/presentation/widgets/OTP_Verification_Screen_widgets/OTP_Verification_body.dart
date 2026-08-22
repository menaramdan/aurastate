import 'package:aurastate/core/app_assets/app_images.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/widgets/custom_button.dart';
import 'package:aurastate/features/Auth/presentation/widgets/OTP_Verification_Screen_widgets/pin_put_verfication.dart';
import 'package:flutter/material.dart';

class OtpVerificationBody extends StatelessWidget {
  const OtpVerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 500.w),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.p, vertical: 32.p),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImages.backgroundemail,
                  width: 64.w,
                  height: 64.h,
                ),
                SizedBox(height: 4),
                Text(
                  AppText.verification,
                  style: AppTextStyle.playerDisplaysemibold24.copyWith(
                    color: AppColors.primarycolor1,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Please enter the 4-digit code sent to your\n"
                  "email address. It may take a few moments\n"
                  "to arrive.",
                  style: AppTextStyle.interRegular14.copyWith(
                    color: AppColors.primarycolor2,
                  ),
                ),
                SizedBox(height: 24.h),
                PinPutVerfication(),
                SizedBox(height: 16),
                CustomButtonApp(
                  text: AppText.verify,
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(8),
                ),
                40.verticalSpace,
                Text(
                  AppText.resendcode,
                  style: AppTextStyle.intersemibold12.copyWith(
                    color: AppColors.primarycolor1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
