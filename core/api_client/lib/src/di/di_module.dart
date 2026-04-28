import 'package:api_client/src/di/api_client_di_params.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @Named(ApiClientDIParams.baseUrl)
  String get baseUrl => const String.fromEnvironment('BASE_URL');

  @lazySingleton
  Dio dio(
    @Named(ApiClientDIParams.authInterceptors)
    List<Interceptor> authInterceptors,
    @Named(ApiClientDIParams.miscellaneousInterceptors)
    List<Interceptor> miscellaneousInterceptors,
    @Named(ApiClientDIParams.baseUrl) String baseUrl,
  ) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));

    dio.interceptors
      ..addAll(authInterceptors)
      ..addAll(miscellaneousInterceptors);

    return dio;
  }
}
