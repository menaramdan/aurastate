import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingPageViewItem2 extends StatefulWidget {
  const OnboardingPageViewItem2(
    this.svgpicture, {
    super.key,
    required Image image,
    required this.describe,
    required this.textbutton,
    required this.title,
    required this.onPressed,
  }) : _image = image;

  final Image _image;
  final String title;
  final String describe;
  final String textbutton;
  final Widget? svgpicture;
  final void Function() onPressed;

  @override
  State<OnboardingPageViewItem2> createState() =>
      _OnboardingPageViewItemState();
}

class _OnboardingPageViewItemState extends State<OnboardingPageViewItem2>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat(reverse: true);
    _floatAnimation = Tween<double>(
      begin: -8.0,
      end: 8.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _floatAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _floatAnimation.value),
                child: child,
              );
            },
            child: widget._image,
          ),
          SizedBox(height: 90.h),
          Text(
            widget.title,
            style: AppTextStyle.playerDisplaybold32.copyWith(
              color: AppColors.primarycolor1,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 52.p),
            child: Text(
              widget.describe,
              style: AppTextStyle.interRegular18.copyWith(
                color: AppColors.primarycolor4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.p),
            child: CustomButtonApp(
              text: widget.textbutton,
              svgPicture: widget.svgpicture,
              onPressed: widget.onPressed,
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
