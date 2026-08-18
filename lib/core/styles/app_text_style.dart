import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:flutter/widgets.dart';

abstract class AppTextStyle {
  static const String familyInter = 'Inter';
  static const String familyePlayfairDisplay = 'PlayfairDisplay';
  static const double _hInter = 1.20;
  static final playfairDisplay32 = TextStyle(
    fontFamily: familyePlayfairDisplay,
    fontSize: 32.fs,
    fontWeight: FontWeight.w500,
    height: _hInter,
  );

  static final interRegular18 = TextStyle(
    fontFamily: familyInter,
    fontSize: 18.fs,
    fontWeight: FontWeight.w400,
    height: 28 / 18,
  );
  static final interRegular16 = TextStyle(
    fontFamily: familyInter,
    fontSize: 16.fs,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
  );
  static final interRegular14 = TextStyle(
    fontFamily: familyInter,
    fontSize: 14.fs,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
  );

  static final intersemibold12 = TextStyle(
    fontFamily: familyInter,
    fontSize: 12.fs,
    fontWeight: FontWeight.w600,
    height: 28 / 12,
  );

  static final intersemibold20 = TextStyle(
    fontFamily: familyInter,
    fontSize: 20.fs,
    fontWeight: FontWeight.w600,
    height: 28 / 20,
  );

  static final interMedium12 = TextStyle(
    fontFamily: familyInter,
    fontSize: 12.fs,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
  );

  static final interMedium14 = TextStyle(
    fontFamily: familyInter,
    fontSize: 14.fs,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
  );

  static final playerDisplaybold32 = TextStyle(
    fontFamily: familyePlayfairDisplay,
    fontSize: 32.fs,
    fontWeight: FontWeight.w700,
    height: 38 / 32,
  );

  static final playerDisplaysemibold20 = TextStyle(
    fontFamily: familyePlayfairDisplay,
    fontSize: 20.fs,
    fontWeight: FontWeight.w700,
    height: 28 / 20,
  );

  static final intersemibold122 = TextStyle(
    fontFamily: familyInter,
    fontSize: 12.fs,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
  );

  static final playerDisplaysemibold24 = TextStyle(
    fontFamily: familyePlayfairDisplay,
    fontSize: 24.fs,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
  );

  static final intersemibold16 = TextStyle(
    fontFamily: familyInter,
    fontSize: 16.fs,
    fontWeight: FontWeight.w700,
    height: 16 / 16,
  );
}
