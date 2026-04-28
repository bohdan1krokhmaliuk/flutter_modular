import 'package:localizations/src/core/app_localizations_delegate.dart';
import 'package:localizations/src/core/model/supported_locale.dart';
import 'package:rick_and_morty_characters/src/presentation/localization/translations/charactersTranslations.i69n.dart';
import 'package:rick_and_morty_characters/src/presentation/localization/translations/charactersTranslations_en_GB.i69n.dart';
import 'package:rick_and_morty_characters/src/presentation/localization/translations/charactersTranslations_en_US.i69n.dart';

class CharactersLocalizationsDelegate
    extends AppLocalizationsDelegate<CharactersTranslations> {
  CharactersLocalizationsDelegate()
    : super(
        (supportedLocale) => switch (supportedLocale) {
          SupportedLocale.enGB => const CharactersTranslations_en_GB(),
          SupportedLocale.enUS => const CharactersTranslations_en_US(),
          null => const CharactersTranslations(),
        },
      );
}
