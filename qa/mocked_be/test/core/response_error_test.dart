import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocked_be/core.dart';

void main() {
  group('ResponseErrorWithBody', () {
    test('getException wraps error body in an Exception', () {
      const error = ResponseErrorWithBody(500, 'Internal error');

      final exception = error.getException();

      check(exception).isA<Exception>();
      check(exception.toString()).contains('Internal error');
    });

    test('has empty headers by default', () {
      const error = ResponseErrorWithBody(400, 'Bad request');

      check(error.headers).isEmpty();
    });

    test('stores provided headers', () {
      const error = ResponseErrorWithBody(
        400,
        'Bad request',
        headers: {'x-custom': 'value'},
      );

      check(error.headers).deepEquals({'x-custom': 'value'});
    });
  });

  group('ResponseErrorWithException', () {
    test('getException returns the original exception', () {
      final original = Exception('original');
      final error = ResponseErrorWithException(original);

      check(error.getException()).identicalTo(original);
    });
  });
}
