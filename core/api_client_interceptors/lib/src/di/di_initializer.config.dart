// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client_interceptors/src/di/di_module.dart' as _i1013;
import 'package:api_client_interceptors/src/interceptors/api_monitoring_interceptor.dart'
    as _i745;
import 'package:api_client_interceptors/src/interceptors/append_api_key_interceptor.dart'
    as _i349;
import 'package:api_client_interceptors/src/interceptors/mocked_be_interceptor.dart'
    as _i953;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mocked_be/src/repository/scenario_repository.dart' as _i367;
import 'package:monitoring/monitoring.dart' as _i472;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final interceptorsModule = _$InterceptorsModule();
    gh.lazySingleton<_i953.MockedBeInterceptor>(
      () => _i953.MockedBeInterceptor(
        gh<_i367.ScenarioRepository>(),
        gh<_i472.Monitoring>(),
      ),
    );
    gh.factory<String>(() => interceptorsModule.apiKey, instanceName: 'ApiKey');
    gh.lazySingleton<_i349.AppendApiKeyInterceptor>(
      () => _i349.AppendApiKeyInterceptor(gh<String>(instanceName: 'ApiKey')),
    );
    gh.lazySingleton<_i745.ApiMonitoringInterceptor>(
      () => _i745.ApiMonitoringInterceptor(monitoring: gh<_i472.Monitoring>()),
    );
    gh.lazySingleton<List<_i361.Interceptor>>(
      () => interceptorsModule.miscellaneousInterceptors(
        gh<_i745.ApiMonitoringInterceptor>(),
        gh<_i953.MockedBeInterceptor>(),
      ),
      instanceName: 'DefaultInterceptors',
    );
    gh.lazySingleton<List<_i361.Interceptor>>(
      () => interceptorsModule.authInterceptors(
        gh<_i349.AppendApiKeyInterceptor>(),
      ),
      instanceName: 'AuthInterceptors',
    );
    return this;
  }
}

class _$InterceptorsModule extends _i1013.InterceptorsModule {}
