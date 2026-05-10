import 'package:localizations/localizations.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/presentation/localization/translations/{{#camelCase}}{{name}}{{/camelCase}}Translations.i69n.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/presentation/localization/translations/{{#camelCase}}{{name}}{{/camelCase}}Translations_en_GB.i69n.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/presentation/localization/translations/{{#camelCase}}{{name}}{{/camelCase}}Translations_en_US.i69n.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}LocalizationsDelegate
    extends AppLocalizationsDelegate<{{#pascalCase}}{{name}}{{/pascalCase}}Translations> {
  {{#pascalCase}}{{name}}{{/pascalCase}}LocalizationsDelegate()
    : super(
        (supportedLocale) => switch (supportedLocale) {
          SupportedLocale.enGB => const {{#pascalCase}}{{name}}{{/pascalCase}}Translations_en_GB(),
          SupportedLocale.enUS => const {{#pascalCase}}{{name}}{{/pascalCase}}Translations_en_US(),
          null => const {{#pascalCase}}{{name}}{{/pascalCase}}Translations(),
        },
      );
}
