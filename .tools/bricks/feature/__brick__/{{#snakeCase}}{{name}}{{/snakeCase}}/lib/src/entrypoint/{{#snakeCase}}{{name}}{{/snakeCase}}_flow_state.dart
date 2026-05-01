import 'package:freezed_annotation/freezed_annotation.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_flow_state.freezed.dart';

@freezed
sealed class {{#pascalCase}}{{name}}{{/pascalCase}}FlowState with _${{#pascalCase}}{{name}}{{/pascalCase}}FlowState {
  const factory {{#pascalCase}}{{name}}{{/pascalCase}}FlowState.initial() = _Initial{{#pascalCase}}{{name}}{{/pascalCase}}FlowState;
}