import 'package:checks/checks.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localizations/src/core/model/supported_locale.dart';

void main() {
  group('SupportedLocale', () {
    group('locales', () {
      test('returns a locale for every enum value', () {
        check(
          SupportedLocale.locales.toList(),
        ).length.equals(SupportedLocale.values.length);
      });

      test('contains en-GB and en-US', () {
        final locales = SupportedLocale.locales.toList();
        check(locales).contains(const Locale('en', 'GB'));
        check(locales).contains(const Locale('en', 'US'));
      });
    });

    group('contains', () {
      test('returns true for a supported locale', () {
        check(SupportedLocale.contains(const Locale('en', 'GB'))).isTrue();
        check(SupportedLocale.contains(const Locale('en', 'US'))).isTrue();
      });

      test('returns false for an unsupported locale', () {
        check(SupportedLocale.contains(const Locale('fr', 'FR'))).isFalse();
      });
    });

    group('from', () {
      test('returns the matching enum value', () {
        check(
          SupportedLocale.from(const Locale('en', 'GB')),
        ).equals(SupportedLocale.enGB);
        check(
          SupportedLocale.from(const Locale('en', 'US')),
        ).equals(SupportedLocale.enUS);
      });

      test('returns null for an unsupported locale', () {
        check(SupportedLocale.from(const Locale('de', 'DE'))).isNull();
      });
    });
  });
}
