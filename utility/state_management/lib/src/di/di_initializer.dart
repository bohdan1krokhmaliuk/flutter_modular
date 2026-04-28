import 'dart:async';

import 'package:di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:state_management/src/di/di_initializer.config.dart';

class StateManagementDIInitializer extends DIInitializer {
  const StateManagementDIInitializer() : super(_init);
}

@injectableInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);
