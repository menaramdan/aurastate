import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.keyboardkey,
    required this.text,
    required this.prefixIcon,

    required this.validator,
    this.obsuretext,
  });
  final TextEditingController controller;
  final TextInputType keyboardkey;
  final String text;
  final Widget prefixIcon;
  final bool? obsuretext;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obsuretext ?? false,
      controller: controller,
      keyboardType: keyboardkey,
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: prefixIcon,
        hintStyle: AppTextStyle.interRegular16.copyWith(
          color: AppColors.primarycolor4,
        ),
        fillColor: Color(0xffE8EDF9),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
