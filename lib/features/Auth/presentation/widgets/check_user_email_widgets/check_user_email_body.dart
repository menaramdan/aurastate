import 'dart:math' as math;
import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/app_assets/app_images.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/routes/app_routes.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/widgets/custom_button.dart';
import 'package:aurastate/features/Auth/presentation/manager/cubit/ForgetandresetpasswordCubit/custom_app_button_1.dart';
import 'package:aurastate/features/Auth/presentation/widgets/check_user_email_widgets/email_widget.dart';
import 'package:aurastate/features/Auth/presentation/widgets/check_user_email_widgets/resend_link_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:open_mail_launcher/open_mail_launcher.dart';

class CheckYourEmailBody extends StatefulWidget {
  const CheckYourEmailBody({super.key});

  @override
  State<CheckYourEmailBody> createState() => _CheckYourEmailBodyState();
}

class _CheckYourEmailBodyState extends State<CheckYourEmailBody>
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

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );

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
                ..setEntry(3, 2, 0.0015)
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
                    width: 75.w,
                    height: 75.h,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppText.checkUserEmail,
                    style: AppTextStyle.playerDisplaysemibold24.copyWith(
                      color: AppColors.primarycolor1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "We have sent a password reset link to\n"
                    "your email address. Please click the\n"
                    "link to set a new password.\n",
                    style: AppTextStyle.interRegular14.copyWith(
                      color: AppColors.primarycolor2,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  EmailWidget(),
                  28.verticalSpace,
                  CustomButtonApp(
                    text: AppText.openEmailApp,
                    onPressed: () async {
                      final available =
                          await OpenMailLauncher.isMailAppAvailable();
                      if (available) {
                        await OpenMailLauncher.openMailApp();
                      }
                    },
                    borderRadius: BorderRadius.circular(16),
                    svgPicture: SvgPicture.asset(
                      AppIcons.arrowing,
                      width: 18.w,
                      height: 18.h,
                    ),
                  ),
                  12.verticalSpace,
                  CustomButtonApp1(
                    text: AppText.backToLogin,
                    onPressed: () {
                      context.push(AppRoutes.loginScreen);
                    },
                    borderRadius: BorderRadius.circular(16),
                    backgroundColor: const Color(0xFFD6E4FA),
                  ),
                  49.verticalSpace,
                  ResendLinkEmail(
                    onTap: () {
                      // Handle resend link action
                    },
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Be sure to check your spam or junk folder if you don\'t see it.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF9CA3AF), // لون رمادي فاتح
                      fontSize: 12,
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
