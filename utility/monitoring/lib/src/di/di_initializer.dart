import 'dart:async';

import 'package:di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:monitoring/src/di/di_initializer.config.dart';

class MonitoringDIInitializer extends DIInitializer {
  const MonitoringDIInitializer() : super(_init);
}

@diInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);
