import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/features/Auth/presentation/widgets/log_in_screen_widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 66.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.p),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: SvgPicture.asset(AppIcons.arrowback),
          ),
        ),
      ),
      body: LoginBody(),
    );
  }
}
