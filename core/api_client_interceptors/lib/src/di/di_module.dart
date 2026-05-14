import 'package:api_client/api_client.dart';
import 'package:api_client_interceptors/src/di/di_interceptor_params.dart';
import 'package:api_client_interceptors/src/interceptors/api_monitoring_interceptor.dart';
import 'package:api_client_interceptors/src/interceptors/append_api_key_interceptor.dart';
import 'package:api_client_interceptors/src/interceptors/mocked_be_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:platform_info/platform_info.dart';

@module
abstract class InterceptorsModule {
  bool get _isTest => PlatformInfo.isFlutterTest;

  @Named(InterceptorDIParams.apiKey)
  String get apiKey => const String.fromEnvironment('API_KEY');

  @lazySingleton
  @Named(ApiClientDIParams.authInterceptors)
  List<Interceptor> authInterceptors(
    AppendApiKeyInterceptor apiKeyInterceptor,
  ) => [if (!_isTest) apiKeyInterceptor];

  @lazySingleton
  @Named(ApiClientDIParams.miscellaneousInterceptors)
  List<Interceptor> miscellaneousInterceptors(
    ApiMonitoringInterceptor monitoringInterceptor,
    MockedBeInterceptor mockedInterceptor,
  ) => [
    if (!_isTest) monitoringInterceptor,
    if (_isTest || kDebugMode) mockedInterceptor,
  ];
}
