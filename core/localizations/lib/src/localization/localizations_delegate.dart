import 'package:localizations/src/core/app_localizations_delegate.dart';
import 'package:localizations/src/core/model/supported_locale.dart';
import 'package:localizations/src/localization/translations/commonTranslations.i69n.dart';
import 'package:localizations/src/localization/translations/commonTranslations_en_GB.i69n.dart';
import 'package:localizations/src/localization/translations/commonTranslations_en_US.i69n.dart';

class CommonTranslationsLocalizationsDelegate
    extends AppLocalizationsDelegate<CommonTranslations> {
  CommonTranslationsLocalizationsDelegate()
    : super(
        (supportedLocale) => switch (supportedLocale) {
          SupportedLocale.enGB => const CommonTranslations_en_GB(),
          SupportedLocale.enUS => const CommonTranslations_en_US(),
          null => const CommonTranslations(),
        },
      );
}
