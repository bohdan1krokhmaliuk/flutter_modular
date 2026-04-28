import 'dart:async';

import 'package:di/src/di_initializer.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;
final diContainer = _DIContainer(_getIt);

Future<void>? initializeDIContainer(DIInitializer initializer) async {
  final initialization = initializer.init(_getIt);
  return initialization is Future ? initialization : null;
}

abstract class DIContainer {
  T call<T extends Object>({dynamic parameter, String? name});

  bool isRegistered<T extends Object>({String? name});
}

class _DIContainer implements DIContainer {
  const _DIContainer(this._getIt);

  final GetIt _getIt;

  @override
  T call<T extends Object>({dynamic parameter, String? name}) =>
      _getIt<T>(param1: parameter, instanceName: name);

  @override
  bool isRegistered<T extends Object>({String? name}) =>
      _getIt.isRegistered<T>(instanceName: name);
}
