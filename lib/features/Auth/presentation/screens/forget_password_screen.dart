import 'package:aurastate/core/functions/build_App_Bar.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/features/Auth/presentation/widgets/forget_password_widgets/forget_password_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      appBar: buildAppBar(context),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.p),
        child: ForgetPasswordBody(),
      ),
    );
  }
}
