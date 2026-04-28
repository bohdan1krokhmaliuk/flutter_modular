import 'dart:async';

import 'package:di/src/di_container.dart';
import 'package:di/src/di_initializer.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

abstract class ScopeDiInitializer {
  static Future<void>? initScope(String scopeName, DIInitializer initializer) {
    _getIt.pushNewScope(scopeName: scopeName);
    return initializeDIContainer(initializer);
  }

  static Future<void> disposeScope(String scopeName) =>
      _getIt.dropScope(scopeName);
}
