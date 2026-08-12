import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:flutter/material.dart';

class OnboardingPageViewItem extends StatelessWidget {
  const OnboardingPageViewItem({
    super.key,
    required this._image,
    required this.title,
  });
  final Image _image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _image,
          SizedBox(height: 40.h),

          Text(title),
        ],
      ),
    );
  }
}
