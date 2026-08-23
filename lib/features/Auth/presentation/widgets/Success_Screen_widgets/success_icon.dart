import 'package:aurastate/core/app_assets/app_images.dart';
import 'package:flutter/material.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFBE8CA).withOpacity(0.8),
                blurRadius: 40,
                spreadRadius: 20,
              ),
            ],
          ),
        ),
        Image.asset(AppImages.succed, width: 100, height: 100),
      ],
    );
  }
}
