import 'package:aurastate/core/app_assets/app_images.dart';
import 'package:aurastate/core/constants/constatn.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/routes/app_routes.dart';
import 'package:aurastate/core/services/shared_prefrence.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/features/splash/presentation/widgets/splash_screen_widget/CustomLinearProgressIndicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _imageOpacity;
  late final Animation<double> _imageScale;

  late final Animation<double> _textOpacity;
  late final Animation<Offset> _textSlide;

  late final Animation<double> _progressOpacity;

  bool _startProgress = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _imageOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.55, curve: Curves.easeOut),
    );

    _imageScale = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.55, curve: Curves.easeOutBack),
      ),
    );

    _textOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.45, 0.85, curve: Curves.easeIn),
    );

    _textSlide = Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.45, 0.85, curve: Curves.easeOutCubic),
          ),
        );

    _progressOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.8, 1.0, curve: Curves.easeIn),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_startProgress) {
        setState(() {
          _startProgress = true;
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 5000), () async {
      final isFirstTime = await SharedPreferenceService.instance.getOnboarding(
        onboardingKey,
      );
      if (mounted) {
        if (isFirstTime) {
          context.go(AppRoutes.welcomScreen);
        } else {
          context.go(AppRoutes.onBoardingScreen);
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Opacity(
                  opacity: _imageOpacity.value,
                  child: Transform.scale(
                    scale: _imageScale.value,
                    child: Image.asset(
                      AppImages.aurastate,
                      width: 192.w,
                      height: 192.h,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                Opacity(
                  opacity: _textOpacity.value,
                  child: SlideTransition(
                    position: _textSlide,
                    child: Text(
                      AppText.textoflogo,
                      style: AppTextStyle.intersemibold12.copyWith(
                        color: AppColors.gray2,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 300.h),

                Opacity(
                  opacity: _progressOpacity.value,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 145.p),
                    child: _startProgress
                        ? const CustomLinearProgressIndicator()
                        : const SizedBox(height: 4),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
