import 'package:aurastate/core/functions/build_App_Bar.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/features/Auth/presentation/widgets/check_user_email_widgets/check_user_email_body.dart';
import 'package:flutter/material.dart';

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      appBar: buildAppBar(context),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.p),
        child: CheckYourEmailBody(email: email ?? ''),
      ),
    );
  }
}
