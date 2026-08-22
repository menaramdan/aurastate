import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/features/Auth/presentation/widgets/Reset_password_widgets/ResetPasswordbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color(0xffF1F5F9),
        leadingWidth: 66.w,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset(AppIcons.arrowback),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.p),
        child: Resetpasswordbody(),
      ),
    );
  }
}
