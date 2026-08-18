import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({
    super.key,
    this.onPressed,
    required this.icon,
    required this.text,
  });
  final void Function()? onPressed;
  final Widget icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 44.p, vertical: 12.p),
        side: BorderSide(color: AppColors.coolLightGray),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: 11),
          Text(
            text,
            style: AppTextStyle.intersemibold12.copyWith(
              color: AppColors.darkcolor,
            ),
          ),
        ],
      ),
    );
  }
}
