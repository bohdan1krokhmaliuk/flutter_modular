import 'package:localizations/localizations.dart';
import 'package:questionnaire/src/presentation/localization/translations/questionnaireTranslations.i69n.dart';
import 'package:questionnaire/src/presentation/localization/translations/questionnaireTranslations_en_GB.i69n.dart';
import 'package:questionnaire/src/presentation/localization/translations/questionnaireTranslations_en_US.i69n.dart';

class QuestionnaireLocalizationsDelegate
    extends AppLocalizationsDelegate<QuestionnaireTranslations> {
  QuestionnaireLocalizationsDelegate()
    : super(
        (supportedLocale) => switch (supportedLocale) {
          SupportedLocale.enGB => const QuestionnaireTranslations_en_GB(),
          SupportedLocale.enUS => const QuestionnaireTranslations_en_US(),
          null => const QuestionnaireTranslations(),
        },
      );
}
