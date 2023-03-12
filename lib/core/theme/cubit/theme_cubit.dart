import 'package:djsportsdesktop/core/theme/color_theme.dart';
import 'package:flutter/material.dart' show TextTheme;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:djsportsdesktop/core/core.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState());

  void onChangeTheme(DJThemeSetting themeSetting) {
    emit(ThemeState(themeSetting: themeSetting));
  }
}
