import 'package:api_client/api_client.dart';
import 'package:api_client_interceptors/src/di/di_interceptor_params.dart';
import 'package:api_client_interceptors/src/interceptors/api_monitoring_interceptor.dart';
import 'package:api_client_interceptors/src/interceptors/append_api_key_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InterceptorsModule {
  @Named(InterceptorDIParams.apiKey)
  String get apiKey => const String.fromEnvironment('API_KEY');

  @lazySingleton
  @Named(ApiClientDIParams.authInterceptors)
  List<Interceptor> authInterceptors(
    AppendApiKeyInterceptor apiKeyInterceptor,
  ) => [apiKeyInterceptor];

  @lazySingleton
  @Named(ApiClientDIParams.miscellaneousInterceptors)
  List<Interceptor> miscellaneousInterceptors(
    ApiMonitoringInterceptor monitoringInterceptor,
  ) => [monitoringInterceptor];
}
