import 'package:freezed_annotation/freezed_annotation.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}.freezed.dart';
part '{{#snakeCase}}{{name}}{{/snakeCase}}.g.dart';

@Freezed(toJson: false)
abstract class {{#pascalCase}}{{name}}{{/pascalCase}} with _${{#pascalCase}}{{name}}{{/pascalCase}} {
  const factory {{#pascalCase}}{{name}}{{/pascalCase}}({required int id, required String data}) = _{{#pascalCase}}{{name}}{{/pascalCase}};

  factory {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(Map<String, dynamic> json) =>
      _${{#pascalCase}}{{name}}{{/pascalCase}}FromJson(json);
}
