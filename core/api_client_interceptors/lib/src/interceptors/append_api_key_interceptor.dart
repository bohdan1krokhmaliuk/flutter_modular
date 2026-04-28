import 'package:api_client/api_client.dart';
import 'package:api_client_interceptors/src/di/di_interceptor_params.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Api in this example doesn't require any auth, but just for the sake of example I do implement it here
@lazySingleton
class AppendApiKeyInterceptor extends Interceptor {
  const AppendApiKeyInterceptor(
    @Named(InterceptorDIParams.apiKey) this._apiKey,
  );

  final String _apiKey;

  /// Can also be FutureOr<void> onRequest(...) and async handle refresh token for example
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final shouldAuthenticate =
        options.extra[ApiAttributesKeys.appendApiKey] == true;

    if (shouldAuthenticate) {
      options.headers['API_KEY'] = _apiKey;
    }

    super.onRequest(options, handler);
  }
}
