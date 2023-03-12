import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:djsportsdesktop/core/theme/cubit/theme_cubit.dart';
import 'package:djsportsdesktop/core/theme/color_theme.dart';

/// Exports for convenience for using any of the public theme objects throughout the app.
///
/// This file is exported to lib/core/core.dart and therefore lets any file import
/// the file lib/core/core.dart and get access to all the public theme objects.
///
export 'package:djsportsdesktop/core/theme/cubit/theme_cubit.dart';
export 'package:djsportsdesktop/core/theme/color_theme.dart';
export 'text_theme.dart';
export 'sizes.dart';
export 'enums.dart';

class ThemeBuilder extends StatelessWidget {
  const ThemeBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(BuildContext context, ThemeData theme) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final theme = _applyWithTheme(
              Theme.of(context), state.textTheme, state.colorTheme);
          return builder(context, theme);
        },
      ),
    );
  }
}

ThemeData _applyWithTheme(
    ThemeData defaultTheme, TextTheme textTheme, ColorTheme colorTheme) {
  return defaultTheme.copyWith(
    scaffoldBackgroundColor: colorTheme.background,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      titleTextStyle: textTheme.labelLarge,
      centerTitle: true,
      actionsIconTheme: IconThemeData(color: colorTheme.white),
      elevation: 0,
      backgroundColor: colorTheme.primary,
      foregroundColor: colorTheme.onPrimary,
      iconTheme: IconThemeData(color: colorTheme.onPrimary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorTheme.onBackgroundHigh,
      selectedItemColor: colorTheme.onPrimary,
      unselectedItemColor: colorTheme.onSurfaceLow,
      elevation: 0,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      unselectedIconTheme: IconThemeData(color: colorTheme.onSurfaceLow),
      selectedIconTheme: IconThemeData(color: colorTheme.primary),
      selectedLabelStyle: textTheme.bodyMedium,
      unselectedLabelStyle: textTheme.bodyMedium,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: colorTheme.surface,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerTheme: DividerThemeData(
        color: colorTheme.onSurfaceLow, thickness: 0.3, space: 0),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (_) {
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6));
          },
        ),
        textStyle: MaterialStateProperty.all(textTheme.labelLarge),
        minimumSize: MaterialStateProperty.all(const Size(0, 45)),
        elevation: MaterialStateProperty.all<double>(0),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 5,
      disabledElevation: 0,
      backgroundColor: colorTheme.primary,
      foregroundColor: colorTheme.white,
    ),
    hintColor: colorTheme.onSurfaceLow,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      filled: true,
      focusColor: Colors.blue,
      fillColor: colorTheme.surface,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorTheme.onBackgroundLow),
        borderRadius: BorderRadius.zero,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorTheme.primary),
        borderRadius: BorderRadius.zero,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorTheme.error),
        borderRadius: BorderRadius.zero,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorTheme.error),
        borderRadius: BorderRadius.zero,
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbVisibility: MaterialStateProperty.all<bool>(true),
      thickness: MaterialStateProperty.all<double>(2.0),
      thumbColor: MaterialStateProperty.all<Color>(colorTheme.onBackgroundLow),
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
    ),
    cardTheme: const CardTheme(elevation: 0),
    textSelectionTheme: defaultTheme.textSelectionTheme.copyWith(
      cursorColor: colorTheme.primary,
    ),
    colorScheme: colorTheme.colorScheme.copyWith(error: colorTheme.error),
  );
}
