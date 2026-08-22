import 'dart:math' as math;
import 'package:aurastate/core/app_assets/app_images.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/routes/app_routes.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/widgets/custom_button.dart';
import 'package:aurastate/features/Auth/presentation/widgets/OTP_Verification_Screen_widgets/pin_put_verfication.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OtpVerificationBody extends StatefulWidget {
  const OtpVerificationBody({super.key});

  @override
  State<OtpVerificationBody> createState() => _OtpVerificationBodyState();
}

class _OtpVerificationBodyState extends State<OtpVerificationBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _rotationAnimation =
        Tween<double>(
          begin: 0,
          end: 2 * math.pi, // 360 درجة كاملة
        ).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
        );

    // يشغل الأنيميشن أول ما الشاشة تظهر
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500.w),
      child: Center(
        child: AnimatedBuilder(
          animation: _rotationAnimation,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015) // perspective
                ..rotateY(_rotationAnimation.value),
              child: child,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
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
                  const SizedBox(height: 4),
                  Text(
                    AppText.verification,
                    style: AppTextStyle.playerDisplaysemibold24.copyWith(
                      color: AppColors.primarycolor1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Please enter the 4-digit code sent to your\n"
                    "email address. It may take a few moments\n"
                    "to arrive.",
                    style: AppTextStyle.interRegular14.copyWith(
                      color: AppColors.primarycolor2,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  const PinPutVerfication(),
                  const SizedBox(height: 16),
                  CustomButtonApp(
                    text: AppText.verify,
                    onPressed: () {
                      context.push(AppRoutes.resetPasswordScreen);
                    },
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
      ),
    );
  }
}
