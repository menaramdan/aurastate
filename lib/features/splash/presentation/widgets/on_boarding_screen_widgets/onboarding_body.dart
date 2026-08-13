import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/app_assets/app_images.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/routes/app_routes.dart';
import 'package:aurastate/features/splash/presentation/widgets/on_boarding_screen_widgets/On_boarding_TopBar.dart';
import 'package:aurastate/features/splash/presentation/widgets/on_boarding_screen_widgets/onboarding_page_view_item.dart';
import 'package:aurastate/features/splash/presentation/widgets/on_boarding_screen_widgets/onboarding_page_view_item2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingBody extends StatelessWidget {
  OnboardingBody({super.key});
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        OnboardingTopBar(pageController: pageController),
        Expanded(child: PageView(
          controller: pageController,
          children: [
              OnboardingPageViewItem(image: Image.asset(AppImages.findYourHome), describe: "Discover a curated collection of "
    "the world's most prestigious "
    "properties, tailored to your lifestyle.", 
              textbutton: AppText.next, onPressed: () { pageController.nextPage(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeOutCubic,); },),


            OnboardingPageViewItem2(SvgPicture.asset(AppIcons.arrow), image: Image.asset(AppImages.home),describe: "A curated collection of architectural "
    "masterpieces for those who value "
    "excellence, elegance, and privacy.", textbutton: AppText.next , title: AppText.titleonboarding, onPressed: () {  pageController.nextPage(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeOutCubic,
  ); },),

     OnboardingPageViewItem2(null,image: Image.asset(AppImages.keys), describe:
    "Experience the pinnacle of real estate convenience. "
    "We ensure seamless closing and bank-grade secure "
    "transactions for your peace of mind.", textbutton: AppText.getStarted, title: AppText.secureOwnership, onPressed: () {context.go(AppRoutes.welcomScreen); },)
              ],
          )),
      ],
    );
  }
}
