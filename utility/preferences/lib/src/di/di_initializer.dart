import 'dart:async';

import 'package:di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:preferences/src/di/di_initializer.config.dart';

class PreferencesDIInitializer extends DIInitializer {
  PreferencesDIInitializer() : super(_init);
}

@injectableInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);
