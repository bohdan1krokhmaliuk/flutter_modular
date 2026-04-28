// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/src/di/di_module.dart' as _i1047;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<String>(() => dioModule.baseUrl, instanceName: 'BaseUrl');
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(
        gh<List<_i361.Interceptor>>(instanceName: 'AuthInterceptors'),
        gh<List<_i361.Interceptor>>(instanceName: 'DefaultInterceptors'),
        gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i1047.DioModule {}
