import 'package:localizations/localizations.dart';
import 'package:sandbox/src/presentation/localization/translations/sandboxTranslations.i69n.dart';
import 'package:sandbox/src/presentation/localization/translations/sandboxTranslations_en_GB.i69n.dart';
import 'package:sandbox/src/presentation/localization/translations/sandboxTranslations_en_US.i69n.dart';

class SandboxLocalizationsDelegate
    extends AppLocalizationsDelegate<SandboxTranslations> {
  SandboxLocalizationsDelegate()
    : super(
        (supportedLocale) => switch (supportedLocale) {
          SupportedLocale.enGB => const SandboxTranslations_en_GB(),
          SupportedLocale.enUS => const SandboxTranslations_en_US(),
          null => const SandboxTranslations(),
        },
      );
}
