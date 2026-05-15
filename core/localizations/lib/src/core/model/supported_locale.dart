import 'package:flutter/widgets.dart';

enum SupportedLocale {
  enGB(Locale('en', 'GB')),
  enUS(Locale('en', 'US'));

  const SupportedLocale(this.locale);

  final Locale locale;

  static Iterable<Locale> get locales =>
      SupportedLocale.values.map((s) => s.locale);

  static bool contains(Locale locale) => locales.contains(locale);

  static SupportedLocale? from(Locale locale) =>
      values.where((s) => s.locale == locale).firstOrNull;
}
