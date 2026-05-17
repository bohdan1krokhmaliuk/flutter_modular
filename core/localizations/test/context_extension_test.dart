import 'package:checks/checks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localizations/src/core/context_extension.dart';
import 'package:localizations/src/core/model/supported_locale.dart';
import 'package:localizations/src/localization/localizations_delegate.dart';
import 'package:localizations/src/localization/translations/commonTranslations.i69n.dart';
import 'package:localizations/src/localization/translations/commonTranslations_en_GB.i69n.dart';
import 'package:localizations/src/localization/translations_extension.dart';

Future<BuildContext> _pumpLocalizedApp(
  WidgetTester tester, {
  Locale locale = const Locale('en', 'GB'),
  Iterable<Locale>? supportedLocales,
  Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
}) async {
  late BuildContext capturedContext;
  await tester.pumpWidget(
    MaterialApp(
      locale: locale,
      supportedLocales: supportedLocales ?? [locale],
      localizationsDelegates: localizationsDelegates,
      home: Builder(
        builder: (context) {
          capturedContext = context;
          return const SizedBox.shrink();
        },
      ),
    ),
  );
  if (localizationsDelegates != null) await tester.pumpAndSettle();
  return capturedContext;
}

void main() {
  group('BuildContextX', () {
    testWidgets('languageCode returns full BCP47 tag', (tester) async {
      final context = await _pumpLocalizedApp(tester);

      check(context.languageCode).equals('en-GB');
    });

    testWidgets('shortLanguageCode returns language without region', (
      tester,
    ) async {
      final context = await _pumpLocalizedApp(tester);

      check(context.shortLanguageCode).equals('en');
    });

    testWidgets('getTranslations returns the loaded delegate translation', (
      tester,
    ) async {
      final context = await _pumpLocalizedApp(
        tester,
        supportedLocales: SupportedLocale.locales,
        localizationsDelegates: [CommonTranslationsLocalizationsDelegate()],
      );

      check(context.getTranslations<CommonTranslations>()).isA<
        CommonTranslations_en_GB
      >();
    });
  });

  group('CommonTranslationsX', () {
    testWidgets('commonTranslations returns the loaded translation', (
      tester,
    ) async {
      final context = await _pumpLocalizedApp(
        tester,
        supportedLocales: SupportedLocale.locales,
        localizationsDelegates: [CommonTranslationsLocalizationsDelegate()],
      );

      check(context.commonTranslations).isA<CommonTranslations_en_GB>();
    });
  });
}
