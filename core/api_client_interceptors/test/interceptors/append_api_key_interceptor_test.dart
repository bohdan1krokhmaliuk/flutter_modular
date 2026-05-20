import 'package:api_client/api_client.dart';
import 'package:api_client_interceptors/src/interceptors/append_api_key_interceptor.dart';
import 'package:checks/checks.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

void main() {
  setUpAll(() => registerFallbackValue(RequestOptions()));

  group('AppendApiKeyInterceptor', () {
    late _MockRequestInterceptorHandler handler;
    late AppendApiKeyInterceptor interceptor;

    setUp(() {
      handler = _MockRequestInterceptorHandler();
      interceptor = const AppendApiKeyInterceptor('test-key');
      when(() => handler.next(any())).thenAnswer((_) {});
    });

    test('adds API_KEY header when appendApiKey is true', () {
      final options = RequestOptions(
        extra: {ApiAttributesKeys.appendApiKey: true},
      );

      interceptor.onRequest(options, handler);

      check(options.headers['API_KEY']).equals('test-key');
    });

    test('does not add header when appendApiKey is false', () {
      final options = RequestOptions(
        extra: {ApiAttributesKeys.appendApiKey: false},
      );

      interceptor.onRequest(options, handler);

      check(options.headers.containsKey('API_KEY')).isFalse();
    });

    test('does not add header when appendApiKey is absent', () {
      final options = RequestOptions();

      interceptor.onRequest(options, handler);

      check(options.headers.containsKey('API_KEY')).isFalse();
    });

    test('always forwards the request to the next handler', () {
      final options = RequestOptions(
        extra: {ApiAttributesKeys.appendApiKey: true},
      );

      interceptor.onRequest(options, handler);

      verify(() => handler.next(options)).called(1);
    });
  });
}
