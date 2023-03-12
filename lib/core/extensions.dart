import 'package:djsportsdesktop/core/core.dart';
import 'package:djsportsdesktop/core/ui/global_loading_overlay.widget.dart';
import 'package:djsportsdesktop/core/ui/utils.dart';
import 'package:djsportsdesktop/data/models/playlist/playlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension StringX on String {
  String ifEmptyPlaceholder(String placeHolder) {
    return trim().isEmpty ? placeHolder : this;
  }

  T toEnum<T>(List<T> enumValues) => stringToEnum(this, enumValues);
}

extension StringNullX on String? {
  bool get isNullOrEmpty {
    return this == null || (this as String).trim().isEmpty;
  }

  String ifNullOrEmptyPlaceholder(String placeHolder) {
    return isNullOrEmpty ? placeHolder : this!;
  }

  T? toEnum<T>(List<T> enumValues) => nullableStringToEnum(this, enumValues);
}

extension BuildContextX on BuildContext {
  GlobalLoadingOverlayWidgetState get globalLoader =>
      GlobalLoadingOverlayWidget.of(this);

  ColorTheme colorTheme({bool listen = true}) {
    return BlocProvider.of<ThemeCubit>(this, listen: listen).state.colorTheme;
  }

  TextTheme textTheme({bool listen = true}) {
    return BlocProvider.of<ThemeCubit>(this, listen: listen).state.textTheme;
  }

  ThemeState themeState({bool listen = true}) {
    return BlocProvider.of<ThemeCubit>(this, listen: listen).state;
  }

  ThemeData themeData() => Theme.of(this);

  RenderBox findRenderBox() => findRenderObject() as RenderBox;

  Size findRenderBoxSize() => findRenderBox().size;

  Size get screenSize => MediaQuery.of(this).size;
}
