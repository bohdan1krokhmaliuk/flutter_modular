import 'dart:developer' as developer;

import 'package:injectable/injectable.dart';

// [HINT] better pass clock dependency for timestamps
@lazySingleton
class Monitoring {
  const Monitoring();

  void debug(String message, {String name = ''}) {
    developer.log(message, time: DateTime.now(), name: name);
  }

  void recordNonFatal(
    Exception exception, {
    StackTrace? stackTrace,
    String? description,
    String name = '',
  }) {
    // [HINT] a good place to track exceptions
    developer.log(
      description ?? exception.toString(),
      time: DateTime.now(),
      name: name,
    );
  }
}
