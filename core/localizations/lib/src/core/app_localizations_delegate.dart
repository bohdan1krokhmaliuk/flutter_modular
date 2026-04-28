import 'package:flutter/material.dart';
import 'package:i69n/i69n.dart';
import 'package:localizations/src/core/model/supported_locale.dart';

typedef TranslationsFactory<T extends I69nMessageBundle> =
    T Function(SupportedLocale?);

class AppLocalizationsDelegate<T extends I69nMessageBundle>
    extends LocalizationsDelegate<T> {
  const AppLocalizationsDelegate(this._translationsFactory);

  final TranslationsFactory<T> _translationsFactory;

  @override
  bool isSupported(Locale locale) => SupportedLocale.contains(locale);

  @override
  Future<T> load(Locale locale) =>
      Future.value(_translationsFactory(SupportedLocale.from(locale)));

  @override
  bool shouldReload(covariant LocalizationsDelegate<T> old) => false;
}
