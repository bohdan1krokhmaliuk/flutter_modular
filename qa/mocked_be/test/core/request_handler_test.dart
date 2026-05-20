import 'package:checks/checks.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocked_be/core.dart';
import 'package:prelude/prelude.dart';

Request _makeRequest({String method = 'GET', String path = '/api'}) =>
    Request.fromOptions(RequestOptions(method: method, path: path));

void main() {
  group('RequestHandler.handle', () {
    test('returns null when matcher does not match', () {
      final handler = RequestHandler(hasMethod('POST'), sendSuccess('ok'));

      check(handler.handle(_makeRequest())).isNull();
    });

    test('returns action result when matcher matches', () async {
      final handler = RequestHandler(hasMethod('GET'), sendSuccess('ok'));

      final result = await handler.handle(_makeRequest())!;

      check(result).isA<Success<String, ResponseError>>();
    });
  });

  group('sendSuccess', () {
    test('returns Success with the response body', () async {
      final action = sendSuccess('{"key":"value"}');

      final result = await action(_makeRequest());

      check(result)
          .isA<Success<String, ResponseError>>()
          .has((s) => s.value, 'value')
          .equals('{"key":"value"}');
    });
  });

  group('sendError', () {
    test('returns Failure with ResponseErrorWithBody', () async {
      final action = sendError(404, responseBody: 'Not found');

      final result = await action(_makeRequest());

      final error = check(result)
          .isA<Failure<String, ResponseError>>()
          .has((f) => f.value, 'value')
          .isA<ResponseErrorWithBody>();
      error.has((e) => e.statusCode, 'statusCode').equals(404);
      error.has((e) => e.errorBody, 'errorBody').equals('Not found');
    });

    test('includes provided headers in the error', () async {
      final action = sendError(403, headers: {'x-reason': 'forbidden'});

      final result = await action(_makeRequest());

      check(result)
          .isA<Failure<String, ResponseError>>()
          .has((f) => f.value, 'value')
          .isA<ResponseErrorWithBody>()
          .has((e) => e.headers, 'headers')
          .deepEquals({'x-reason': 'forbidden'});
    });
  });

  group('sendException', () {
    test('returns Failure wrapping the provided exception', () async {
      final exception = Exception('network error');
      final action = sendException(exception);

      final result = await action(_makeRequest());

      check(result)
          .isA<Failure<String, ResponseError>>()
          .has((f) => f.value, 'value')
          .isA<ResponseErrorWithException>()
          .has((e) => e.getException(), 'exception')
          .identicalTo(exception);
    });
  });

  group('sendMultiple', () {
    test(
      'returns responses in sequence, repeating last when exhausted',
      () async {
        final action = sendMultiple([
          sendSuccess('first'),
          sendSuccess('second'),
        ]);
        final request = _makeRequest();

        final r1 = await action(request);
        final r2 = await action(request);
        final r3 = await action(request);

        check(r1)
            .isA<Success<String, ResponseError>>()
            .has((s) => s.value, 'value')
            .equals('first');
        check(r2)
            .isA<Success<String, ResponseError>>()
            .has((s) => s.value, 'value')
            .equals('second');
        check(r3)
            .isA<Success<String, ResponseError>>()
            .has((s) => s.value, 'value')
            .equals('second');
      },
    );
  });
}
