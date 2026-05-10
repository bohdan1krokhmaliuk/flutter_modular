import 'package:injectable/injectable.dart';
import 'package:prelude/prelude.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/domain/api/{{#snakeCase}}{{name}}{{/snakeCase}}_api.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/domain/model/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';

@injectable
class {{#pascalCase}}{{name}}{{/pascalCase}}Repository {
  const {{#pascalCase}}{{name}}{{/pascalCase}}Repository(this._api);

  final {{#pascalCase}}{{name}}{{/pascalCase}}Api _api;

  Future<Result<{{#pascalCase}}{{name}}{{/pascalCase}}, FailureException>> get{{#pascalCase}}{{name}}{{/pascalCase}}() async {
    final result = await Result.fromAsync(() => _api.get{{#pascalCase}}{{name}}{{/pascalCase}}());
    return result.map((s) => s.data);
  }
}
