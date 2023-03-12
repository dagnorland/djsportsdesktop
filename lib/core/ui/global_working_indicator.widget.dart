import 'package:djsportsdesktop/core/core.dart';
import 'package:djsportsdesktop/core/extensions.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GlobalWorkingIndicatorWidget extends StatelessWidget {
  const GlobalWorkingIndicatorWidget({
    required this.size,
    this.alignment,
    this.backgroundColor,
    super.key,
  });

  final double size;
  final Alignment? alignment;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final indicator = LoadingAnimationWidget.discreteCircle(
      color: backgroundColor ?? context.colorTheme(listen: false).surface,
      size: size,
      secondRingColor: context.colorTheme().primary,
      thirdRingColor: context.colorTheme().secondary,
    );

    if (alignment == null) {
      return indicator;
    }

    return Align(alignment: alignment!, child: indicator);
  }
}
