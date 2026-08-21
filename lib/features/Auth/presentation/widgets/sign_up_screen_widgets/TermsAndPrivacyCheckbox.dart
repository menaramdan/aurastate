import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndPrivacyCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final VoidCallback? onTermsTap;
  final VoidCallback? onPrivacyTap;

  const TermsAndPrivacyCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.onTermsTap,
    this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF6B7280);
    const linkColor = Color(0xFF0F2851);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: linkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6), // حواف دائرية خفيفة
            ),
            side: const BorderSide(
              color: Color(0xFFCBD5E1), // لون الإطار الخارجي
              width: 1.5,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14,
                color: textColor,
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: 'I agree to the ',
                  style: AppTextStyle.interRegular14,
                ),
                TextSpan(
                  text: 'Terms & Conditions',
                  style: AppTextStyle.interRegular14.copyWith(color: linkColor),
                  recognizer: TapGestureRecognizer()..onTap = onTermsTap,
                ),
                const TextSpan(text: ' and \n'),
                TextSpan(
                  text: 'Privacy Policy.',
                  style: AppTextStyle.interRegular14.copyWith(color: linkColor),
                  recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
