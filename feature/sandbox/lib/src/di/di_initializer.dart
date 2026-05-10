import 'dart:async';

import 'package:di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:sandbox/src/di/di_initializer.config.dart';

class SandboxDIInitializer extends DIInitializer {
  const SandboxDIInitializer() : super(_init);
}

@diInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);
