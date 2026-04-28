// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mocked_be/src/mocks/mocked_be_interceptor.dart' as _i68;
import 'package:mocked_be/src/repository/scenario_repository.dart' as _i367;
import 'package:preferences/preferences.dart' as _i695;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i367.ScenarioRepository>(
      () => _i367.ScenarioRepository(gh<_i695.Preferences>()),
    );
    gh.factory<_i68.MockedBeInterceptor>(
      () => _i68.MockedBeInterceptor(gh<_i367.ScenarioRepository>()),
    );
    return this;
  }
}
