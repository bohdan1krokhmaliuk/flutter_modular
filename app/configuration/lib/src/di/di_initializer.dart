import 'dart:async';

import 'package:configuration/src/di/di_initializer.config.dart';
import 'package:di/di.dart';
import 'package:get_it/get_it.dart';

class ConfigurationDIInitializer extends DIInitializer {
  const ConfigurationDIInitializer() : super(_init);
}

@diInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);
