import 'dart:io';

import 'package:checks/checks.dart';
import 'package:dio/dio.dart';
import 'package:domain/src/extensions/error_extension.dart';
import 'package:prelude/prelude.dart';
import 'package:test/test.dart';

void main() {
  group('FailureExceptionX', () {
    group('mapDioException', () {
      test('passes DioException to builder', () {
        final dio = DioException(requestOptions: RequestOptions());
        final failure = FailureException(dio);

        final result = failure.mapDioException((e) => e);

        check(result).identicalTo(dio);
      });

      test('passes null to builder when inner is not a DioException', () {
        final failure = FailureException(Exception('other'));

        final result = failure.mapDioException((e) => e);

        check(result).isNull();
      });
    });

    group('isNotFoundException', () {
      test('returns true for 404 response', () {
        final failure = FailureException(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: HttpStatus.notFound,
            ),
          ),
        );

        check(failure.isNotFoundException).isTrue();
      });

      test('returns false for non-404 response', () {
        final failure = FailureException(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: HttpStatus.internalServerError,
            ),
          ),
        );

        check(failure.isNotFoundException).isFalse();
      });

      test('returns false when DioException has no response', () {
        final failure = FailureException(
          DioException(requestOptions: RequestOptions()),
        );

        check(failure.isNotFoundException).isFalse();
      });

      test('returns false when inner is not a DioException', () {
        final failure = FailureException(Exception('network error'));

        check(failure.isNotFoundException).isFalse();
      });
    });
  });
}
