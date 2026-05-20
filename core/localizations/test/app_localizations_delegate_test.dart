import 'package:checks/checks.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localizations/src/core/app_localizations_delegate.dart';
import 'package:localizations/src/localization/localizations_delegate.dart';
import 'package:localizations/src/localization/translations/commonTranslations.i69n.dart';
import 'package:localizations/src/localization/translations/commonTranslations_en_GB.i69n.dart';
import 'package:localizations/src/localization/translations/commonTranslations_en_US.i69n.dart';

void main() {
  group('AppLocalizationsDelegate', () {
    final delegate = AppLocalizationsDelegate<CommonTranslations>(
      (locale) => const CommonTranslations(),
    );

    test('isSupported returns true for a supported locale', () {
      check(delegate.isSupported(const Locale('en', 'GB'))).isTrue();
    });

    test('isSupported returns false for an unsupported locale', () {
      check(delegate.isSupported(const Locale('fr', 'FR'))).isFalse();
    });

    test('load returns the translation from the factory', () async {
      final result = await delegate.load(const Locale('en', 'GB'));

      check(result).isA<CommonTranslations>();
    });

    test('shouldReload always returns false', () {
      check(delegate.shouldReload(delegate)).isFalse();
    });
  });

  group('CommonTranslationsLocalizationsDelegate', () {
    late CommonTranslationsLocalizationsDelegate delegate;

    setUp(() => delegate = CommonTranslationsLocalizationsDelegate());

    test('load returns en-GB translations for en-GB locale', () async {
      final result = await delegate.load(const Locale('en', 'GB'));

      check(result).isA<CommonTranslations_en_GB>();
    });

    test('load returns en-US translations for en-US locale', () async {
      final result = await delegate.load(const Locale('en', 'US'));

      check(result).isA<CommonTranslations_en_US>();
    });

    test('load returns base translations for an unknown locale', () async {
      final result = await delegate.load(const Locale('fr', 'FR'));

      check(result.runtimeType).equals(CommonTranslations);
    });
  });
}
