import 'package:flutter/material.dart';

abstract class AppPalette {
  // Dark mode scaffold color
  static const kDarkScaffoldColor = Color(0xff1E1E1E);

  // Light mode scaffold color
  static const kLightScaffoldColor = Colors.white;

  // Primary color: Slightly vibrant for elements that need highlighting
  static const kPrimaryColor = Color(0xff3A8DFF); // Electric Blue

  // Dark mode icon and navigation bar color
  static const kGnavColor =
      Color(0xff2E3A59); // Slate Blue for dark mode accents

  // Background for widgets (like cards) in dark mode with subtle contrast
  static const kCardColor = Color(0xff37474F); // Dark Grayish Cyan

  // Text colors
  static const kTextPrimaryColor = Color(0xffE0E0E0); // Off-white for main text
  static const kTextSecondaryColor =
      Color(0xffB0BEC5); // Muted Gray for secondary text

  // White with slight opacity for overlays or buttons
  static Color kWhitePrimaryColor = const Color(0xffE0E0E0).withOpacity(0.1);

  // Accent color for highlights
  static const kAccentColor = Color(0xff1EC6B1); // Vibrant Teal

  // Light theme accent color
  static const kAmberColor = Colors.amber;
}
