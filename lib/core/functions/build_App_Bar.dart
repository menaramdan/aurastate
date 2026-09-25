import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget buildAppBar(BuildContext context) {
  return AppBar(
    leadingWidth: 66.w,
    leading: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.p),
      child: GestureDetector(
        onTap: () => context.pop(),
        child: SvgPicture.asset(AppIcons.arrowback),
      ),
    ),
  );
}
