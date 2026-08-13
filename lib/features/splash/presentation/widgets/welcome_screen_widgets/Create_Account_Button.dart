
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    super.key,required this.onPressed, 
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(onPressed: onPressed, style:  ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: AppColors.primarycolor1 ,width: 1.5),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      )),child: Text(AppText.createAccount ,style: AppTextStyle.intersemibold12 .copyWith(color: AppColors.primarycolor1),textAlign: TextAlign.center,)),
    );
  }
}