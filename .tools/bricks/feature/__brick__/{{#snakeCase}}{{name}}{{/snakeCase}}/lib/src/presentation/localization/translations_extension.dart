import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/presentation/localization/translations/{{#camelCase}}{{name}}{{/camelCase}}Translations.i69n.dart';

extension {{#pascalCase}}{{name}}{{/pascalCase}}TranslationsX on BuildContext {
  {{#pascalCase}}{{name}}{{/pascalCase}}Translations get translations =>
      getTranslations<{{#pascalCase}}{{name}}{{/pascalCase}}Translations>();
}
