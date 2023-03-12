import 'package:flutter/material.dart';

import 'package:djsportsdesktop/core/theme/enums.dart';

extension ColorUtils on Color {
  Color applyOverlayColor(Color overlayColor) {
    if (alpha < 255) {
      throw Exception('the fromColor should not have any form of opacity');
    }

    final int r2 = overlayColor.red;
    final int g2 = overlayColor.green;
    final int b2 = overlayColor.blue;
    final double a2 = overlayColor.alpha / 255;

    final int r = ((a2 * r2) + ((1.0 - a2) * red)).round().clamp(0, 255);
    final int g = ((a2 * g2) + ((1.0 - a2) * green)).round().clamp(0, 255);
    final int b = ((a2 * b2) + ((1.0 - a2) * blue)).round().clamp(0, 255);

    return Color.fromRGBO(r, g, b, 1);
  }

  double _opacityByEmphasis(Emphasis emphasis) {
    switch (emphasis) {
      case Emphasis.full:
        return 1;
      case Emphasis.high:
        return 0.87;
      case Emphasis.medium:
        return 0.6;
      case Emphasis.low:
        return 0.38;
      case Emphasis.focus:
        return 0.12;
      case Emphasis.inactive:
        return 0.54;
      case Emphasis.none:
      default:
        return 0;
    }
  }

  Color withLightOverlay(Emphasis emphasis) {
    return applyOverlayColor(Colors.white.withEmphasis(emphasis));
  }

  Color withDarkOverlay(Emphasis emphasis) {
    return applyOverlayColor(Colors.black.withEmphasis(emphasis));
  }

  Color withEmphasis(Emphasis emphasis) {
    return withOpacity(_opacityByEmphasis(emphasis));
  }

  Color multiplyOpacity(double multiplier) {
    return withOpacity((opacity * multiplier).clamp(0.0, 1.0));
  }

  double contrast(Color color2) {
    // http://www.w3.org/TR/WCAG20/#contrast-ratiodef
    final lum1 = computeLuminance();
    final lum2 = color2.computeLuminance();

    if (lum1 > lum2) {
      return (lum1 + 0.05) / (lum2 + 0.05);
    }
    return (lum2 + 0.05) / (lum1 + 0.05);
  }

  Color optimalContrastColor(List<Color> comparableColors,
      {
      // The tollerance attribute will add a number tollerance where the left value in the comparable list
      // will have a tollerance with the right side of the list
      tollerance = 0.0}) {
    assert(comparableColors.length == 2);

    final contrasts = comparableColors.map((c) => contrast(c)).toList();
    return comparableColors[contrasts
        .indexOf(contrasts.reversed.reduce((double first, double second) {
      if (first + tollerance > second) {
        return first;
      }
      return second;
    }))];
  }

  MaterialColor swatchFromHex() {
    final Map<int, Color> swatch = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(value, swatch);
  }

  String colorToARGBString() {
    return '#${value.toRadixString(16)}';
  }
}

extension TextStyleColorUtils on TextStyle {
  TextStyle withEmphasis(Emphasis emphasis) {
    return copyWith(color: color?.withEmphasis(emphasis));
  }

  TextStyle withColor(Color color, [Emphasis? emphasis]) {
    return copyWith(
        color: emphasis == null ? color : color.withEmphasis(emphasis));
  }
}
