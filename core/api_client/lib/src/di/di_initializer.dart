import 'dart:async';

import 'package:api_client/src/di/di_initializer.config.dart';
import 'package:di/di.dart';
import 'package:get_it/get_it.dart';

class ApiClientDIInitializer extends DIInitializer {
  const ApiClientDIInitializer() : super(_init);
}

@diInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);
