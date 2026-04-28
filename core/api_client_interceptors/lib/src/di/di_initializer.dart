import 'dart:async';

import 'package:api_client_interceptors/src/di/di_initializer.config.dart';
import 'package:di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

class InterceptorsDIInitializer extends DIInitializer {
  InterceptorsDIInitializer() : super(_init);
}

@injectableInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);
