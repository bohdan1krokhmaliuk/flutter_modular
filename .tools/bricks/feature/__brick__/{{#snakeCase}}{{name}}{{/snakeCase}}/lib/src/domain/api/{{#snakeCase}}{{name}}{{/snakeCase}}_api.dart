import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/domain/model/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_api.g.dart';

@injectable
@RestApi()
abstract class {{#pascalCase}}{{name}}{{/pascalCase}}Api {
  @factoryMethod
  factory {{#pascalCase}}{{name}}{{/pascalCase}}Api(Dio dio) = _{{#pascalCase}}{{name}}{{/pascalCase}}Api;

  @authenticatedApiRequest
  @POST('/my/endpoint/path')
  Future<void> submit();
  
  @authenticatedApiRequest
  @GET('/{{#snakeCase}}{{name}}{{/snakeCase}}')
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> get{{#pascalCase}}{{name}}{{/pascalCase}}();
}
