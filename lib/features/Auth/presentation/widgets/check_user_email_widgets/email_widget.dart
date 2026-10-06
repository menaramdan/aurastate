import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.p, vertical: 11.p),
      decoration: BoxDecoration(
        color: const Color(0xFFD6E4FA),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppIcons.email),
          const SizedBox(width: 12),
          Text(
            email,
            style: TextStyle(
              color: const Color(0xFF1D2A44),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
