import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/features/Auth/presentation/widgets/log_in_screen_widgets/social_Media.dart';
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
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 40.p, vertical: 18.p),
        side: BorderSide(color: AppColors.coolLightGray),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: SocialMedia(icon: icon, text: text),
    );
  }
}
