import 'package:flutter/material.dart';

class ResendLinkEmail extends StatelessWidget {
  const ResendLinkEmail({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Didn't receive the email? ",
          style: TextStyle(color: Color(0xFF6B7280), fontSize: 14),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            'Resend Link',
            style: TextStyle(
              color: Color(0xFF1D2A44),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
