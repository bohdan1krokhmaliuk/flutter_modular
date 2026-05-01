import 'dart:async';

import 'package:di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/di/di_initializer.config.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}DIInitializer extends DIInitializer {
  const {{#pascalCase}}{{name}}{{/pascalCase}}DIInitializer() : super(_init);
}

@injectableInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);
