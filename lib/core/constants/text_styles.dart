import 'package:flutter/material.dart';
import 'package:neura_chat/core/utils/functions/responsive_font.dart';

abstract class AppStyles {
  // Regular styles
  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: responsiveFontSize(fontSize: 12, context: context),
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: responsiveFontSize(fontSize: 14, context: context),
    );
  }

  static TextStyle styleRegular15(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: responsiveFontSize(fontSize: 14, context: context),
    );
  }

  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: responsiveFontSize(fontSize: 16, context: context),
    );
  }

  static TextStyle styleRegularGrey16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.grey,
      fontSize: responsiveFontSize(fontSize: 16, context: context),
    );
  }

  static TextStyle styleRegular18(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: responsiveFontSize(fontSize: 18, context: context),
    );
  }

  static TextStyle styleRegular20(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: responsiveFontSize(fontSize: 20, context: context),
    );
  }

  static TextStyle styleGreyReg16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.grey,
      fontSize: responsiveFontSize(fontSize: 16, context: context),
    );
  }

  // Bold styles
  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveFontSize(fontSize: 14, context: context),
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveFontSize(fontSize: 16, context: context),
    );
  }

  static TextStyle styleBold22(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveFontSize(fontSize: 22, context: context),
    );
  }

  static TextStyle styleBold24(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveFontSize(fontSize: 24, context: context),
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveFontSize(fontSize: 18, context: context),
    );
  }

  static TextStyle styleBold28(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveFontSize(fontSize: 28, context: context),
    );
  }

  static TextStyle styleBold25(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveFontSize(fontSize: 25, context: context),
    );
  }

  static TextStyle styleBold17(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveFontSize(fontSize: 17, context: context),
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveFontSize(fontSize: 20, context: context),
    );
  }

  static TextStyle styleBold19(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveFontSize(fontSize: 19, context: context),
    );
  }

  static TextStyle styleBold32(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveFontSize(fontSize: 32, context: context),
    );
  }

  // Semi-bold weight

  static TextStyle styleSemiBold27(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: responsiveFontSize(fontSize: 27, context: context),
    );
  }

  static TextStyle styleSemiBold23(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: responsiveFontSize(fontSize: 23, context: context),
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: responsiveFontSize(fontSize: 24, context: context),
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: responsiveFontSize(fontSize: 18, context: context),
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: responsiveFontSize(fontSize: 20, context: context),
    );
  }

  static TextStyle styleSemiBold17(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: responsiveFontSize(fontSize: 17, context: context),
    );
  }

  static TextStyle styleSemiBold15(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: responsiveFontSize(fontSize: 15, context: context),
    );
  }

  static TextStyle style700w16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: responsiveFontSize(fontSize: 16, context: context),
    );
  }
}
