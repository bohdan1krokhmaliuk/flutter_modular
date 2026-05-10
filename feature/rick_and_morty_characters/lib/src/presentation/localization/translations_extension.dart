import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:rick_and_morty_characters/src/presentation/localization/translations/charactersTranslations.i69n.dart';

extension CharactersTranslationsX on BuildContext {
  CharactersTranslations get translations =>
      getTranslations<CharactersTranslations>();
}
