import 'dart:ui';

import 'package:aurastate/core/routes/app_routes.dart';
import 'package:aurastate/features/Auth/presentation/screens/log_in_screen.dart';
import 'package:aurastate/features/Auth/presentation/screens/sign_up_screen.dart';
import 'package:aurastate/features/splash/presentation/screens/Splash_screen.dart';
import 'package:aurastate/features/splash/presentation/screens/onboarding_screen.dart';
import 'package:aurastate/features/splash/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter approuter = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LogInScreen(),
            transitionDuration: const Duration(
              milliseconds: 800,
            ), // بطيئة عشان تلاحظها
            reverseTransitionDuration: const Duration(milliseconds: 800),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.linear;

                  final tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
          );
        },
      ),
      GoRoute(
        path: AppRoutes.onBoardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),

      GoRoute(
        path: AppRoutes.welcomScreen,
        builder: (context, state) => const WelcomeScreen(),
      ),

      GoRoute(
        path: AppRoutes.signupScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );
}
