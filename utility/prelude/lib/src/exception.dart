import 'package:meta/meta.dart';

class FailureException implements Exception {
  FailureException(Object exception, [StackTrace? stackTrace])
    : inner = exception is Exception ? exception : Exception(exception),
      stackTrace = stackTrace ?? StackTrace.current;

  @visibleForTesting
  FailureException.empty() : inner = Exception(), stackTrace = StackTrace.empty;

  final Exception inner;
  final StackTrace stackTrace;
}
