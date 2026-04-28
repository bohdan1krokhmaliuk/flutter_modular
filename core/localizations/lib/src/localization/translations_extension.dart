import 'package:flutter/material.dart';
import 'package:localizations/src/core/context_extension.dart';
import 'package:localizations/src/localization/translations/commonTranslations.i69n.dart';

extension CommonTranslationsX on BuildContext {
  CommonTranslations get commonTranslations =>
      getTranslations<CommonTranslations>();
}
