import 'package:djsportsdesktop/data/models/playlist/playlist.dart';
import 'package:djsportsdesktop/data/repository/playlist_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';

import 'package:djsportsdesktop/core/core.dart';
import 'package:djsportsdesktop/l10n.dart';

import 'app_bar_clock.widget.dart';

TextStyle textStyle(BuildContext context, {bool weighted = false}) {
  return context.textTheme().bodyLarge!.copyWith(
        color: context.colorTheme().onPrimary,
        fontWeight: weighted ? FontWeight.w500 : FontWeight.normal,
      );
}

class MainPageAppBar extends StatelessWidget {
  const MainPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.appBarHeight,
      width: double.infinity,
      color: context.colorTheme().appBarBackgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.bodyInsetHorizontal,
        vertical: AppSizes.bodyInsetVertical,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text('Some info', style: textStyle(context, weighted: true)),
                const Gap(AppSizes.largeGap),
                Text('Yett Some info',
                    style: textStyle(context, weighted: true)),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'DJSportsDesktop',
                style: textStyle(context),
              ),
            ),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: AppBarClockWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
