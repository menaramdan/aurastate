import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:flutter/material.dart';

class TextDriver extends StatelessWidget {
  const TextDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFC4C4C4), thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.p),
          child: Text(
            'OR CONTINUE WITH',
            style: TextStyle(
              color: const Color(0xFF4A4A4A),
              fontSize: 14.fs,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xFFC4C4C4), thickness: 1)),
      ],
    );
  }
}
