import 'dart:developer' as developer;

import 'package:injectable/injectable.dart';

@lazySingleton
class Monitoring {
  const Monitoring();

  void developerLog(final String message) {
    developer.log(message, time: DateTime.now());
  }
}
