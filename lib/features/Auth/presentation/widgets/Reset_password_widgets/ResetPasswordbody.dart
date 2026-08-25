import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/features/Auth/presentation/widgets/Reset_password_widgets/update_password_card.dart';
import 'package:aurastate/features/Auth/presentation/widgets/sign_up_screen_widgets/remember_password.dart';
import 'package:flutter/material.dart';

class Resetpasswordbody extends StatefulWidget {
  const Resetpasswordbody({super.key});

  @override
  State<Resetpasswordbody> createState() => _ResetpasswordbodyState();
}

class _ResetpasswordbodyState extends State<Resetpasswordbody>
    with SingleTickerProviderStateMixin {
  final TextEditingController passwordcontroller = TextEditingController();

  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.3, curve: Curves.easeIn),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            84.verticalSpace,
            Text(
              AppText.resetPassword,
              style: AppTextStyle.playerDisplaysemibold24.copyWith(
                color: AppColors.primarycolor1,
              ),
            ),
            Text(
              "Please choose a strong password to ensure\n"
              "your account remains secure and exclusive.",
              style: AppTextStyle.interRegular16.copyWith(
                color: AppColors.colorofpinput,
              ),
            ),
            const SizedBox(height: 24),
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: UpdatePasswordCard(),
              ),
            ),
            24.verticalSpace,
            const RememberPassword(),
          ],
        ),
      ),
    );
  }
}
