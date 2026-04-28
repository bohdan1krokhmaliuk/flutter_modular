part of 'test_app_initializer.dart';

/// Registers all "app wide" used injections which have redefined mocks for tests
class _ApiInterceptorInitializer extends DIInitializer {
  _ApiInterceptorInitializer()
    : super((getIt, _) {
        getIt
          ..registerSingleton<List<Interceptor>>(
            <Interceptor>[],
            instanceName: ApiClientDIParams.authInterceptors,
          )
          ..registerSingleton<List<Interceptor>>(
            <Interceptor>[],
            instanceName: ApiClientDIParams.miscellaneousInterceptors,
          );

        final dio = diContainer<Dio>();
        dio.interceptors.add(
          MockedBeInterceptor(diContainer<ScenarioRepository>()),
        );

        return getIt;
      });
}
