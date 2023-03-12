import 'package:djsportsdesktop/core/core.dart';
import 'package:djsportsdesktop/core/theme/color_theme.dart';
import 'package:flutter/material.dart';

const _defaultFontStyle = TextStyle(fontFamily: 'IBMPlexSans');
const _classicFontStyle = TextStyle(fontFamily: 'IBMPlexMono');

extension TextThemeX on TextTheme {
  TextStyle? get buttonLarge =>
      labelLarge?.copyWith(fontSize: 16, fontWeight: FontWeight.bold);
}

TextStyle getFontStyleFromThemeSetting(DJThemeSetting themeSetting) {
  if (themeSetting == DJThemeSetting.classic) {
    return _classicFontStyle;
  }

  return _defaultFontStyle;
}

TextTheme getTextTheme(
  ColorTheme colorTheme, {
  required TextStyle fontStyle,
}) {
  return TextTheme(
    displayLarge: fontStyle.copyWith(
      fontSize: 96,
      fontWeight: FontWeight.w300, // light
      letterSpacing: -1.5,
      height: 1.5,
      color: colorTheme.onBackgroundHigh,
    ),
    displayMedium: fontStyle.copyWith(
      fontSize: 60,
      fontWeight: FontWeight.w300, // light
      letterSpacing: -0.5,
      height: 1.5,
      color: colorTheme.onBackgroundHigh,
    ),
    displaySmall: fontStyle.copyWith(
      fontSize: 48,
      fontWeight: FontWeight.w400, // regular
      letterSpacing: 0,
      height: 1.5,
      color: colorTheme.onBackgroundHigh,
    ),
    headlineMedium: fontStyle.copyWith(
      fontSize: 34,
      fontWeight: FontWeight.w400, // regular
      letterSpacing: 0.25,
      height: 1.5,
      color: colorTheme.onBackgroundHigh,
    ),
    headlineSmall: fontStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w400, // regular
      letterSpacing: 0,
      height: 1.5,
      color: colorTheme.onBackgroundHigh,
    ),
    titleLarge: fontStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w400, // medium
      letterSpacing: 0.15,
      height: 1.5,
      color: colorTheme.onBackgroundHigh,
    ),
    titleMedium: fontStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400, // regular
      letterSpacing: 0.15,
      color: colorTheme.onBackgroundHigh,
    ),
    titleSmall: fontStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500, // medium
      letterSpacing: 0.1,
      color: colorTheme.onBackgroundMedium,
    ),
    bodyLarge: fontStyle.copyWith(
      fontSize: 16, // most used in tables
      fontWeight: FontWeight.w400, // regular
      color: colorTheme.onBackgroundHigh,
    ),
    bodyMedium: fontStyle.copyWith(
      fontSize: 13, // Used in bodies of boxes/dialogues
      fontWeight: FontWeight.w400, // regular
      color: colorTheme.onBackgroundHigh,
    ),
    labelLarge: fontStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.bold, // medium
      color: colorTheme.surface,
    ),
    bodySmall: fontStyle.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w600, // regular
      color: colorTheme.onBackgroundMedium,
    ),
    labelSmall: fontStyle.copyWith(
      fontSize: 8,
      fontWeight: FontWeight.normal, // medium
      letterSpacing: 1,
      color: colorTheme.surface,
    ),
  );
}
