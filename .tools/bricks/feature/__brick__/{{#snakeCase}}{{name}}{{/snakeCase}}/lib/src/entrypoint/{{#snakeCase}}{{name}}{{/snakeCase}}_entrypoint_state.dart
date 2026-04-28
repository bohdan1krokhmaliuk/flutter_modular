import 'package:freezed_annotation/freezed_annotation.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_entrypoint_state.freezed.dart';

@freezed
class {{#pascalCase}}{{name}}{{/pascalCase}}EntrypointState with _${{#pascalCase}}{{name}}{{/pascalCase}}EntrypointState {
  const factory {{#pascalCase}}{{name}}{{/pascalCase}}EntrypointState.initial() = _Initial{{#pascalCase}}{{name}}{{/pascalCase}}EntrypointState;
}