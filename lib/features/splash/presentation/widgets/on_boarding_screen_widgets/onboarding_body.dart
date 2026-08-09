import 'package:aurastate/features/splash/presentation/widgets/on_boarding_screen_widgets/On_boarding_TopBar.dart';
import 'package:flutter/material.dart';

class OnboardingBody extends StatelessWidget {
  OnboardingBody({super.key});
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        OnboardingTopBar(pageController: pageController),
        Expanded(child: PageView(children: [
              
              
              
              ],
          )),
      ],
    );
  }
}
