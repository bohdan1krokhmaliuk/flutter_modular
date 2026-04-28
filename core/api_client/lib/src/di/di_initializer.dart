import 'dart:async';

import 'package:api_client/src/di/di_initializer.config.dart';
import 'package:di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

class ApiClientDIInitializer extends DIInitializer {
  ApiClientDIInitializer() : super(_init);
}

@injectableInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);
