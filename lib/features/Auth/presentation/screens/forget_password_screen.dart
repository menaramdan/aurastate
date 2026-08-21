import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/features/Auth/presentation/widgets/forget_password_widgets/forget_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      appBar: AppBar(
        backgroundColor: Color(0xffF1F5F9),
        leadingWidth: 66.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.p),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: SvgPicture.asset(AppIcons.arrowback),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.p),
        child: ForgetPasswordBody(),
      ),
    );
  }
}
