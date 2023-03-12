import 'dart:async';

import 'package:djsportsdesktop/core/core.dart';
import 'package:djsportsdesktop/l10n.dart';
import 'package:flutter/material.dart';

class AppBarClockWidget extends StatefulWidget {
  const AppBarClockWidget({super.key});

  @override
  State<AppBarClockWidget> createState() => _AppBarClockWidgetState();
}

class _AppBarClockWidgetState extends State<AppBarClockWidget> {
  late final Timer _timer;
  late DateTime date;

  String get formattedDate {
    final hour = date.hour < 10 ? '0${date.hour}' : date.hour;
    final minite = date.minute < 10 ? '0${date.minute}' : date.minute;
    final second = date.second < 10 ? '0${date.second}' : date.second;

    final dateFormatted = formatDateLong(context, date);
    final timeFormatted = '$hour:$minite:$second';

    return '$dateFormatted, $timeFormatted';
  }

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => date = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formattedDate,
      style: context.textTheme().bodyLarge!.copyWith(
            color: context.colorTheme().onPrimary,
          ),
    );
  }
}
