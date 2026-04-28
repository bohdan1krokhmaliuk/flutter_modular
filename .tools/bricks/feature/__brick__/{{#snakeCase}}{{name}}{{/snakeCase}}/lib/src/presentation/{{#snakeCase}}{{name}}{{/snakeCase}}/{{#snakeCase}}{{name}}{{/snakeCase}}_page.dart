import 'package:design_system/design_system.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/presentation/{{#snakeCase}}{{name}}{{/snakeCase}}/bloc/{{#snakeCase}}{{name}}{{/snakeCase}}_bloc.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/presentation/localization/translations_extension.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}Page extends StatelessWidget {
  const {{#pascalCase}}{{name}}{{/pascalCase}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.translations.stub)),
      body: BlocProvider(
        create: (_) => diContainer<{{#pascalCase}}{{name}}{{/pascalCase}}Bloc>(),
        child: Placeholder(),
      ),
    );
  }
}
