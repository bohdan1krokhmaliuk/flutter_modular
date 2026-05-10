part of '{{#snakeCase}}{{name}}{{/snakeCase}}_bloc.dart';

@blocState
sealed class {{#pascalCase}}{{name}}{{/pascalCase}}State with _${{#pascalCase}}{{name}}{{/pascalCase}}State {
  const factory {{#pascalCase}}{{name}}{{/pascalCase}}State.initial() = _InitialState;
}
