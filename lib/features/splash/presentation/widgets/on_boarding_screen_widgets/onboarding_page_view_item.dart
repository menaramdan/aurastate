import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPageViewItem extends StatefulWidget {
  const OnboardingPageViewItem({
    super.key,
    required Image image,
    required this.describe,
    required this.textbutton,
    required this.onPressed,
  }) : _image = image;

  final Image _image;
  final void Function() onPressed;
  final String describe;
  final String textbutton;

  @override
  State<OnboardingPageViewItem> createState() => _OnboardingPageViewItemState();
}

class _OnboardingPageViewItemState extends State<OnboardingPageViewItem>
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
          SizedBox(height: 40.h),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Find Your\n',
                  style: AppTextStyle.playerDisplaybold32.copyWith(
                    color: AppColors.primarycolor1,
                  ),
                ),
                TextSpan(
                  text: 'Dream Home',
                  style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    color: AppColors.primarycolor3,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 43.p),
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
              height: 56.h,
              text: widget.textbutton,
              svgPicture: SvgPicture.asset(AppIcons.arrow),
              onPressed: widget.onPressed,
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
