import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinPutVerfication extends StatelessWidget {
  const PinPutVerfication({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      obscureText: true,
      separatorBuilder: (index) => const SizedBox(width: 16),
      defaultPinTheme: PinTheme(
        width: 56.w,
        height: 64.h,
        decoration: BoxDecoration(
          color: Color(0xffE8EDF9),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      obscuringWidget: Container(
        width: 12.w,
        height: 32.h,
        decoration: BoxDecoration(
          color: AppColors.colorofpinput,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
