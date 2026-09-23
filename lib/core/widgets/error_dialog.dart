import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/app_assets/app_images.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.massage});
  final String massage;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(32.r),
      ),
      backgroundColor: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.waring, width: 80.w, height: 80.h),
          SizedBox(height: 16.h),
          Text(
            AppText.somethingwentwrong,
            style: AppTextStyle.playerDisplaysemibold20,
          ),
          8.verticalSpace,
          Text(
            massage,
            style: AppTextStyle.interRegular18.copyWith(
              color: AppColors.errorcolor,
            ),
          ),
          23.verticalSpace,
          CustomButtonApp(
            text: 'Try Again',
            onPressed: () {},
            borderRadius: BorderRadius.circular(16),
            svgPicture: SvgPicture.asset(AppIcons.return_, width: 12.w),
          ),
        ],
      ),
    );
  }
}
