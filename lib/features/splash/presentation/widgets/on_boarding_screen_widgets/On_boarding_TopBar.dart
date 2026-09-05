import 'package:aurastate/core/constants/constatn.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/routes/app_routes.dart';
import 'package:aurastate/core/services/shared_prefrence.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/features/splash/presentation/widgets/on_boarding_screen_widgets/smooth_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingTopBar extends StatelessWidget {
  const OnboardingTopBar({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.p),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Smoothpagecontroller(pageController: pageController),
          GestureDetector(
            onTap: () async {
              final prefs = SharedPreferenceService.instance;
              await prefs.saveOnboarding(onboardingKey, true);
              context.push(AppRoutes.welcomScreen);
            },
            child: Text(
              AppText.skip,
              style: AppTextStyle.intersemibold12.copyWith(
                color: AppColors.primarycolor1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
