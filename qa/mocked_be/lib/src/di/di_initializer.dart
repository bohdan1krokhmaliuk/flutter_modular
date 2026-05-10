import 'dart:async';

import 'package:di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:mocked_be/src/di/di_initializer.config.dart';

class MockedBeDIInitializer extends DIInitializer {
  const MockedBeDIInitializer() : super(_init);
}

@diInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);
