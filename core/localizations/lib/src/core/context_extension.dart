import 'package:flutter/material.dart';
import 'package:i69n/i69n.dart';

extension BuildContextX on BuildContext {
  /// Returns a syntactically valid Unicode BCP47 Locale Identifier.
  ///
  /// Some examples of such identifiers: "en", "es-419", "hi-Deva-IN" and
  /// "zh-Hans-CN". See http://www.unicode.org/reports/tr35/ for technical
  /// details.
  String get languageCode => Localizations.localeOf(this).toLanguageTag();

  /// Returns language code without region code (ex. 'de' for 'de_GE' locale)
  String get shortLanguageCode => Localizations.localeOf(this).languageCode;

  T getTranslations<T extends I69nMessageBundle>() =>
      Localizations.of(this, T)!;
}
