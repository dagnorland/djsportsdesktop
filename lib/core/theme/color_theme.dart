import 'package:flutter/material.dart';

import 'package:djsportsdesktop/core/theme/enums.dart';
import 'package:djsportsdesktop/core/theme/utils/color_utils.dart';

class ColorTheme {
  const ColorTheme._({
    required this.theme,
    required this.background,
    required this.backgroundVariant,
    required this.onBackgroundHigh,
    required this.onBackgroundMedium,
    required this.onBackgroundLow,
    required this.onBackgroundActive,
    required this.onBackgroundVariant,
    required this.surface,
    required this.onSurfaceHigh,
    required this.onSurfaceMedium,
    required this.onSurfaceLow,
    required this.onSurfaceActive,
    required this.onSurfaceVariant,
    required this.primary,
    required this.primaryActive,
    required this.primaryVariant,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondaryMedium,
  });

  factory ColorTheme.fromThemeSetting(DJThemeSetting theme) {
    return const ColorTheme.light();
  }

  const ColorTheme.light()
      : this._(
          theme: DJThemeSetting.light,
          background: const Color(0xFFF3F3F3),
          backgroundVariant: const Color(0xFFFAFAFA),
          onBackgroundHigh: const Color(0xFF1D1D1D),
          onBackgroundMedium: const Color(0xFF686868),
          onBackgroundLow: const Color(0xFFE6EBF1),
          onBackgroundActive: const Color(0x1E000000),
          onBackgroundVariant: const Color(0xFFF6F9FC),
          surface: const Color(0xFFFFFFFF),
          onSurfaceHigh: const Color(0xDE000000),
          onSurfaceMedium: const Color.fromARGB(100, 61, 51, 44),
          onSurfaceLow: const Color(0x61000000),
          onSurfaceActive: const Color(0x1E000000),
          onSurfaceVariant: const Color(0xFF2EB5A5),
          primary: const Color(0xFF1A73E8),
          primaryActive: const Color(0xFF135CBB),
          primaryVariant: const Color(0xFF0C1544),
          onPrimary: const Color(0XFFFFFFFF),
          secondary: const Color(0xFFEC6608),
          onSecondaryMedium: const Color(0x99000000),
        );

  const ColorTheme.classic()
      : this._(
          theme: DJThemeSetting.classic,
          background: const Color(0xFF000079),
          primary: const Color(0xFFFFFFFF),
          primaryActive: const Color(0xFFE6EBF1),
          primaryVariant: const Color(0xFF0C1544),
          onPrimary: const Color(0xFFBC3B3B),
          backgroundVariant: const Color(0xFFFAFAFA),
          onBackgroundHigh: const Color(0xFF1D1D1D),
          onBackgroundMedium: const Color(0xFF686868),
          onBackgroundLow: const Color(0xFFE6EBF1),
          onBackgroundActive: const Color(0x1E000000),
          onBackgroundVariant: const Color(0xFF2EB5A5),
          surface: const Color(0xFFFFFFFF),
          onSurfaceHigh: const Color(0xDE000000),
          onSurfaceMedium: const Color.fromARGB(100, 61, 51, 44),
          onSurfaceLow: const Color(0x61000000),
          onSurfaceActive: const Color(0x1E000000),
          onSurfaceVariant: const Color(0xFF2EB5A5),
          secondary: const Color(0xFFEC6608),
          onSecondaryMedium: const Color(0x99000000),
        );

  final DJThemeSetting theme;

  final Color white = const Color(0xFFFFFFFF);
  final Color black = const Color(0xFF212121);
  final Color transparent = const Color(0x00FFFFFF);

  final Color background;

  final Color backgroundVariant;
  final Color onBackgroundHigh;
  final Color onBackgroundMedium;
  final Color onBackgroundLow;
  final Color onBackgroundActive;
  final Color onBackgroundVariant;

  final Color surface;

  final Color onSurfaceHigh;
  final Color onSurfaceMedium;
  final Color onSurfaceLow;
  final Color onSurfaceActive;
  final Color onSurfaceVariant;

  final Color primary;
  final Color primaryActive;
  final Color primaryVariant;
  final Color onPrimary;

  final Color secondary;
  final Color onSecondaryMedium;

  final Color errorLight = const Color(0xFFFCE8E7);
  final Color error = const Color(0xFFDC302F);
  final Color errorDark = const Color(0xFFC20A0A);
  final Color infoLight = const Color(0xFFE5E9FC);
  final Color info = const Color(0xFF0F00E3);
  final Color infoDark = const Color(0xFF001B9F);
  final Color successLight = const Color(0xFFDAF1E2);
  final Color success = const Color(0xFF089F3F);
  final Color successDark = const Color(0xFF066F2C);
  final Color warningLight = const Color(0xFFFEF4D9);
  final Color warning = const Color(0xFFFAB300);
  final Color warningDark = const Color(0xFF8F6600);

  final Color vippsBackground = const Color(0xFFFF5B24);

  ColorScheme get colorScheme {
    return ColorScheme(
      primary: primary,
      onPrimary: white.withEmphasis(Emphasis.high),
      secondary: secondary,
      onSecondary: onSecondaryMedium.withEmphasis(Emphasis.high),
      background: background,
      onBackground: onBackgroundMedium.withEmphasis(Emphasis.high),
      surface: surface,
      onSurface: onSurfaceHigh.withEmphasis(Emphasis.high),
      error: errorLight,
      onError: errorDark,
      brightness: Brightness.light,
    );
  }

  /// primary
  Color get appBarBackgroundColor => primaryVariant;

  /// onBachgroundHigh
  Color get navBarBackgroundColor => onBackgroundHigh;

  /// onBackgroundMedium
  Color get navBarItemBackgroundColorActive => onBackgroundMedium;
}
