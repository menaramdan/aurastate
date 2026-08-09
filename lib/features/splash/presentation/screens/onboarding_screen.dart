import 'package:aurastate/features/splash/presentation/widgets/on_boarding_screen_widgets/onboarding_body.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: OnboardingBody()));
  }
}
