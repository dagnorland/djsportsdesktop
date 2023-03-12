part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState._({
    this.themeSetting = DJThemeSetting.light,
    required this.colorTheme,
    required this.textTheme,
  });

  factory ThemeState({DJThemeSetting themeSetting = DJThemeSetting.light}) {
    final colors = ColorTheme.fromThemeSetting(themeSetting);
    final fontStyle = getFontStyleFromThemeSetting(themeSetting);
    final text = getTextTheme(colors, fontStyle: fontStyle);

    return ThemeState._(
        themeSetting: themeSetting, colorTheme: colors, textTheme: text);
  }

  final ColorTheme colorTheme;
  final TextTheme textTheme;
  final DJThemeSetting themeSetting;

  @override
  List<Object?> get props => [colorTheme, textTheme, themeSetting];
}
