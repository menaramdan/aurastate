import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Smoothpagecontroller extends StatelessWidget {
  const Smoothpagecontroller({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      effect: WormEffect(
        dotHeight: 4.h,
        dotWidth: 32.w,
        activeDotColor: AppColors.primarycolor1,
        dotColor: const Color(0xffC5C6CF),
        radius: 10,
        spacing: 8,
      ),
    );
  }
}
