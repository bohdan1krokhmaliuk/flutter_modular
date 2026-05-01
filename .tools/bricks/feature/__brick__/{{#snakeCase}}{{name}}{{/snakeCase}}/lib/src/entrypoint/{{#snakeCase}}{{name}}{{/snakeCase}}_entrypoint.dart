import 'package:entrypoint/entrypoint.dart';
import 'package:flutter/material.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/entrypoint/{{#snakeCase}}{{name}}{{/snakeCase}}_flow_state.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/di/di_initializer.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/presentation/{{#snakeCase}}{{name}}{{/snakeCase}}/{{#snakeCase}}{{name}}{{/snakeCase}}_page.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/presentation/localization/localizations_delegate.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}Entrypoint extends StatelessWidget {
  const {{#pascalCase}}{{name}}{{/pascalCase}}Entrypoint({super.key});

  @override
  Widget build(BuildContext context) => Entrypoint<{{#pascalCase}}{{name}}{{/pascalCase}}FlowState>.flow(
    state: const {{#pascalCase}}{{name}}{{/pascalCase}}FlowState.initial(),
    onGeneratePages: _onGeneratePages,
    initializer: const {{#pascalCase}}{{name}}{{/pascalCase}}DIInitializer(),
    localizationsDelegate: {{#pascalCase}}{{name}}{{/pascalCase}}LocalizationsDelegate(),
  );

  List<Page<dynamic>> _onGeneratePages({{#pascalCase}}{{name}}{{/pascalCase}}FlowState state, List<Page<dynamic>> pages,
  ) => 
    state.map(
      initial: (state) => [
        const MaterialPage(child: {{#pascalCase}}{{name}}{{/pascalCase}}Page()),
      ]
    );
}
