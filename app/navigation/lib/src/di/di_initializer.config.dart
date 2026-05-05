// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i718;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:navigation/src/navigators/sandbox_navigator.dart' as _i359;
import 'package:navigation/src/router/router.dart' as _i304;
import 'package:sandbox/sandbox.dart' as _i1042;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i304.MiniclientRouter>(
      () => _i304.MiniclientRouter(gh<_i718.GlobalKey<_i718.NavigatorState>>()),
    );
    gh.factory<_i1042.SandboxNavigator>(
      () => _i359.SandboxNavigatorImplementation(gh<_i304.MiniclientRouter>()),
    );
    return this;
  }
}
