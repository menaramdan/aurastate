import 'package:aurastate/core/app_assets/app_images.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/widgets/custom_button.dart';
import 'package:aurastate/features/splash/presentation/widgets/welcome_screen_widgets/Create_Account_Button.dart';
import 'package:flutter/material.dart';

class WelcomeScreenBody extends StatefulWidget {
  const WelcomeScreenBody({super.key});

  @override
  State<WelcomeScreenBody> createState() => _WelcomeScreenBodyState();
}

class _WelcomeScreenBodyState extends State<WelcomeScreenBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _logoFade;
  late final Animation<double> _logoScale;

  late final Animation<double> _titleFade;
  late final Animation<Offset> _titleSlide;

  late final Animation<double> _subtitleFade;
  late final Animation<Offset> _subtitleSlide;

  late final Animation<double> _loginBtnFade;
  late final Animation<Offset> _loginBtnSlide;

  late final Animation<double> _createBtnFade;
  late final Animation<Offset> _createBtnSlide;

  late final Animation<double> _image1Fade;
  late final Animation<Offset> _image1Slide;

  late final Animation<double> _image2Fade;
  late final Animation<Offset> _image2Slide;

  late final Animation<double> _image3Fade;
  late final Animation<Offset> _image3Slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    _logoFade = _fade(0.0, 0.35);
    _logoScale = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.35, curve: Curves.easeOutBack),
      ),
    );

    _titleFade = _fade(0.2, 0.5);
    _titleSlide = _slideUp(0.2, 0.5);

    _subtitleFade = _fade(0.3, 0.6);
    _subtitleSlide = _slideUp(0.3, 0.6);

    _loginBtnFade = _fade(0.45, 0.75);
    _loginBtnSlide = _slideUp(0.45, 0.75);

    _createBtnFade = _fade(0.55, 0.85);
    _createBtnSlide = _slideUp(0.55, 0.85);

    _image1Fade = _fade(0.65, 1.0);
    _image1Slide = _slideUp(0.65, 1.0, offset: 0.3);

    _image2Fade = _fade(0.72, 1.0);
    _image2Slide = _slideUp(0.72, 1.0, offset: 0.3);

    _image3Fade = _fade(0.79, 1.0);
    _image3Slide = _slideUp(0.79, 1.0, offset: 0.3);

    _controller.forward();
  }

  Animation<double> _fade(double start, double end) {
    return CurvedAnimation(
      parent: _controller,
      curve: Interval(start, end, curve: Curves.easeOut),
    );
  }

  Animation<Offset> _slideUp(double start, double end, {double offset = 0.15}) {
    return Tween<Offset>(
      begin: Offset(0, offset),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                100.verticalSpace,

                FadeTransition(
                  opacity: _logoFade,
                  child: ScaleTransition(
                    scale: _logoScale,
                    child: Image.asset(
                      AppImages.aurastate,
                      width: 192.w,
                      height: 192.h,
                    ),
                  ),
                ),

                FadeTransition(
                  opacity: _titleFade,
                  child: SlideTransition(
                    position: _titleSlide,
                    child: Text(
                      "${AppText.refinedLiving}\n${AppText.startsHere}",
                      style: AppTextStyle.playerDisplaybold32
                          .copyWith(color: AppColors.primarycolor1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                FadeTransition(
                  opacity: _subtitleFade,
                  child: SlideTransition(
                    position: _subtitleSlide,
                    child: Text(
                      'Discover a curated collection of the\n'
                      "world's most prestigious estates.",
                      style: AppTextStyle.interRegular18
                          .copyWith(color: AppColors.primarycolor2),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                40.verticalSpace,

                FadeTransition(
                  opacity: _loginBtnFade,
                  child: SlideTransition(
                    position: _loginBtnSlide,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.p),
                      child: CustomButtonApp(
                        text: AppText.login,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                FadeTransition(
                  opacity: _createBtnFade,
                  child: SlideTransition(
                    position: _createBtnSlide,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.p),
                      child: CreateAccountButton(onPressed: () {}),
                    ),
                  ),
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeTransition(
                      opacity: _image1Fade,
                      child: SlideTransition(
                        position: _image1Slide,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            AppImages.image1,
                            width: 103.w,
                            height: 129.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    16.horizontalSpace,
                    FadeTransition(
                      opacity: _image2Fade,
                      child: SlideTransition(
                        position: _image2Slide,
                        child: Transform.translate(
                          offset: Offset(0, -20.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              AppImages.image2,
                              width: 103.w,
                              height: 129.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    16.horizontalSpace,
                    FadeTransition(
                      opacity: _image3Fade,
                      child: SlideTransition(
                        position: _image3Slide,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            AppImages.image3,
                            width: 103.w,
                            height: 129.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}