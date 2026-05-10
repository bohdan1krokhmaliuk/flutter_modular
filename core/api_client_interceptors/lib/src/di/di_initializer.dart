import 'dart:async';

import 'package:api_client_interceptors/src/di/di_initializer.config.dart';
import 'package:di/di.dart';
import 'package:get_it/get_it.dart';

class InterceptorsDIInitializer extends DIInitializer {
  const InterceptorsDIInitializer() : super(_init);
}

@diInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);
