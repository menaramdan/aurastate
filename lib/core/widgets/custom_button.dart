import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomButtonApp extends StatelessWidget {
  const CustomButtonApp({
    super.key,
    required this.text,
    this.svgPicture,
    required this.onPressed,
    required this.borderRadius,
  });
  final void Function() onPressed;
  final String text;
  final Widget? svgPicture;
  final BorderRadiusGeometry borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primarycolor1,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppTextStyle.intersemibold20.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 8),
            svgPicture ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
