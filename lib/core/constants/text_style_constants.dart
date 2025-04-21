import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';

class TextStyleConstants {
  static const TextStyle heading1 = TextStyle(
    fontFamily: TextConstants.lobsterFontFamily,
    color: ColorConstants.darkChestnut,
    fontSize: 45,
    fontWeight: FontWeight.w400,
    height: 1.35,
    letterSpacing: 0,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: TextConstants.poppinsFontFamily,
    color: ColorConstants.grey,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1,
    letterSpacing: 0,
  );

  static const TextStyle splashScreenHeading = TextStyle(
    fontFamily: TextConstants.lobsterFontFamily,
    color: ColorConstants.white,
    fontSize: 60,
    fontWeight: FontWeight.w400,
    height: 1,
    letterSpacing: 0,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontFamily: TextConstants.robotoFontFamily,
    color: ColorConstants.darkChestnut,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1,
    letterSpacing: 0,
  );

  static const TextStyle bodyText2 = TextStyle(
    color: ColorConstants.lightGrey,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1,
    letterSpacing: 0,
  );

  static const TextStyle bodyText3 = TextStyle(
    fontFamily: TextConstants.robotoFontFamily,
    color: ColorConstants.darkChestnut,
    fontSize: 25,
    fontWeight: FontWeight.w600,
    height: 1.35,
    letterSpacing: 0,
  );

  static const TextStyle bodyText4 = TextStyle(
    fontFamily: TextConstants.robotoFontFamily,
    color: ColorConstants.darkChestnut,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.35,
    letterSpacing: 0,
  );

  static const TextStyle bodyText5 = TextStyle(
    fontFamily: TextConstants.robotoFontFamily,
    color: ColorConstants.mediumGrey,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.35,
    letterSpacing: 0,
  );

  static const TextStyle bodyText6 = TextStyle(
    fontFamily: TextConstants.robotoFontFamily,
    color: ColorConstants.limeGreen,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.35,
    letterSpacing: 0,
  );

  static const TextStyle bodyText7 = TextStyle(
    fontFamily: TextConstants.robotoFontFamily,
    color: ColorConstants.white,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.35,
    letterSpacing: 0,
  );

  static const TextStyle alertText = TextStyle(
    color: ColorConstants.red,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    fontFamily: TextConstants.poppinsFontFamily,
    height: 1,
    letterSpacing: 0,
  );
}
