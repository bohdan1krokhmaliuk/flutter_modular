// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sandbox/src/configurator/sandbox_configurator.dart' as _i355;
import 'package:sandbox/src/domain/api/sandbox_api.dart' as _i996;
import 'package:sandbox/src/domain/repository/sandbox_repository.dart' as _i533;
import 'package:sandbox/src/navigator/sandbox_navigator.dart' as _i324;
import 'package:sandbox/src/presentation/sandbox/bloc/sandbox_bloc.dart'
    as _i630;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i996.SandboxApi>(() => _i996.SandboxApi(gh<_i361.Dio>()));
    gh.factory<_i533.SandboxRepository>(
      () => _i533.SandboxRepository(gh<_i996.SandboxApi>()),
    );
    gh.factory<_i630.SandboxBloc>(
      () => _i630.SandboxBloc(
        gh<_i533.SandboxRepository>(),
        gh<_i355.SandboxConfigurator>(),
        gh<_i324.SandboxNavigator>(),
      ),
    );
    return this;
  }
}
