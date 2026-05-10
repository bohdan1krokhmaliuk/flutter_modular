part of '{{#snakeCase}}{{name}}{{/snakeCase}}_bloc.dart';

@blocEvent
sealed class {{#pascalCase}}{{name}}{{/pascalCase}}Event with _${{#pascalCase}}{{name}}{{/pascalCase}}Event {
  const factory {{#pascalCase}}{{name}}{{/pascalCase}}Event.load() = _LoadEvent;
}
