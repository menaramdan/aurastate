import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/features/Auth/presentation/widgets/check_user_email_widgets/check_user_email_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class OtpverificationScreen extends StatelessWidget {
  const OtpverificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      appBar: AppBar(
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
        child: CheckYourEmailBody(),
      ),
    );
  }
}
