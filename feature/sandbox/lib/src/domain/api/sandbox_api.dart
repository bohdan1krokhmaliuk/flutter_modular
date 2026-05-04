import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'sandbox_api.g.dart';

@injectable
@RestApi()
abstract class SandboxApi {
  @factoryMethod
  factory SandboxApi(Dio dio) = _SandboxApi;

  @authenticatedApiRequest
  @POST('/uri/invalid')
  Future<void> callInvalidUri();

  // [HINT] This api call doesn't append auth header
  @GET('/uri/no_token')
  Future<void> callNoTokenApi();
}
