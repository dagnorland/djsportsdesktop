import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const dateFormatNo = 'dd.MM.yyyy';
const dateFormatNoLong = 'E d. MMM yyyy';
const timeFormatNo = 'HH:mm';
const dateTimeFormatNo = '$dateFormatNo $timeFormatNo';

AppLocalizations $t(BuildContext context) => AppLocalizations.of(context)!;

String currentLocale(BuildContext context) =>
    Localizations.localeOf(context).toString();

String formatAmount(
  BuildContext context,
  double amount, {
  int decimalDigits = 2,
  bool disableGrouping = false,
}) {
  final formatter = NumberFormat.currency(
    locale: currentLocale(context),
    symbol: '',
    decimalDigits: decimalDigits,
  );

  if (disableGrouping) {
    formatter.turnOffGrouping();
  }

  return formatter.format(amount).trimLeft();
}

DateTime? tryParseDate(BuildContext context, String value) {
  final dateFormat = DateFormat(dateFormatNo, currentLocale(context));

  try {
    return dateFormat.parseStrict(value).toLocal();
  } catch (e) {
    return null;
  }
}

DateTime? tryParseTime(BuildContext context, String value) {
  final dateFormat = DateFormat(timeFormatNo, currentLocale(context));

  try {
    return dateFormat.parseStrict(value).toLocal();
  } catch (e) {
    return null;
  }
}

DateTime? tryParseDateTime(BuildContext context, String value) {
  final dateFormat = DateFormat(dateTimeFormatNo, currentLocale(context));

  try {
    return dateFormat.parseStrict(value).toLocal();
  } catch (e) {
    return null;
  }
}

String formatDate(BuildContext context, DateTime date) {
  return DateFormat(
    dateFormatNo,
    currentLocale(context),
  ).format(date.toLocal());
}

String formatDateLong(BuildContext context, DateTime date) {
  String formatted = DateFormat(
    dateFormatNoLong,
    currentLocale(context),
  ).format(date.toLocal());

  // we want "tir 25. okt 2022" instead of "tir. 25. okt. 2022"

  final dayDot = formatted.indexOf('.');
  formatted = formatted.replaceRange(dayDot, dayDot + 1, '');
  final monthDot = formatted.lastIndexOf('.');

  return formatted.replaceRange(monthDot, monthDot + 1, '');
}

String formatTime(BuildContext context, DateTime date) {
  return DateFormat(
    timeFormatNo,
    currentLocale(context),
  ).format(date.toLocal());
}

String formatDateTime(BuildContext context, DateTime date) {
  return DateFormat(
    dateTimeFormatNo,
    currentLocale(context),
  ).format(date.toLocal());
}
