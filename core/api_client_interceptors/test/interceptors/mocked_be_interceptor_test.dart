import 'package:api_client/api_client.dart';
import 'package:api_client_interceptors/src/interceptors/mocked_be_interceptor.dart';
import 'package:checks/checks.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocked_be/core.dart';
import 'package:mocked_be/mocked_be.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monitoring/monitoring.dart';

class _MockScenarioRepository extends Mock implements ScenarioRepository {}

class _MockMonitoring extends Mock implements Monitoring {}

class _MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

final _matchAll = RequestHandler((_) => true, sendSuccess('{"ok": true}'));
final _matchNone = RequestHandler((_) => false, sendSuccess('{"ok": true}'));

void main() {
  setUpAll(() {
    registerFallbackValue(RequestOptions());
    registerFallbackValue(Response<dynamic>(requestOptions: RequestOptions()));
    registerFallbackValue(DioException(requestOptions: RequestOptions()));
  });

  group('MockedBeInterceptor', () {
    late _MockScenarioRepository repository;
    late _MockMonitoring monitoring;
    late _MockRequestInterceptorHandler handler;
    late MockedBeInterceptor interceptor;

    setUp(() {
      repository = _MockScenarioRepository();
      monitoring = _MockMonitoring();
      handler = _MockRequestInterceptorHandler();
      interceptor = MockedBeInterceptor(repository, monitoring);
      when(
        () => monitoring.debug(any(), name: any(named: 'name')),
      ).thenAnswer((_) {});
    });

    test('passes through when no active scenario', () async {
      when(
        () => repository.getActiveScenario(fallback: any(named: 'fallback')),
      ).thenReturn(null);
      when(() => handler.isCompleted).thenReturn(false);
      when(() => handler.next(any())).thenAnswer((_) {});

      await interceptor.onRequest(RequestOptions(), handler);

      verify(() => handler.next(any())).called(1);
      verifyNever(() => handler.resolve(any(), any()));
      verifyNever(() => handler.reject(any()));
    });

    test(
      'resolves when active scenario has matching success handler',
      () async {
        final scenario = Scenario('test', [_matchAll]);
        when(
          () => repository.getActiveScenario(fallback: any(named: 'fallback')),
        ).thenReturn(scenario);
        when(() => handler.isCompleted).thenReturn(true);
        when(() => handler.resolve(any(), any())).thenAnswer((_) {});

        await interceptor.onRequest(RequestOptions(), handler);

        verify(() => handler.resolve(any(), any())).called(1);
        verifyNever(() => handler.next(any()));
      },
    );

    test('rejects when active scenario has matching error handler', () async {
      final scenario = Scenario('test', [
        RequestHandler(
          (_) => true,
          sendError(404, responseBody: '{"error": "not_found"}'),
        ),
      ]);
      when(
        () => repository.getActiveScenario(fallback: any(named: 'fallback')),
      ).thenReturn(scenario);
      when(() => handler.isCompleted).thenReturn(true);
      when(() => handler.reject(any())).thenAnswer((_) {});

      await interceptor.onRequest(RequestOptions(), handler);

      verify(() => handler.reject(any())).called(1);
      verifyNever(() => handler.next(any()));
    });

    test('passes through when no handler in scenario matches', () async {
      final scenario = Scenario('test', [_matchNone]);
      when(
        () => repository.getActiveScenario(fallback: any(named: 'fallback')),
      ).thenReturn(scenario);
      when(() => handler.isCompleted).thenReturn(false);
      when(() => handler.next(any())).thenAnswer((_) {});

      await interceptor.onRequest(RequestOptions(), handler);

      verify(() => handler.next(any())).called(1);
      verifyNever(() => handler.resolve(any(), any()));
      verifyNever(() => handler.reject(any()));
    });

    test('uses fallback scenario name from request extra', () async {
      when(
        () => repository.getActiveScenario(fallback: any(named: 'fallback')),
      ).thenReturn(null);
      when(() => handler.isCompleted).thenReturn(false);
      when(() => handler.next(any())).thenAnswer((_) {});
      final options = RequestOptions(
        extra: {ApiAttributesKeys.useMockScenario: 'my_scenario'},
      );

      await interceptor.onRequest(options, handler);

      verify(
        () => repository.getActiveScenario(fallback: 'my_scenario'),
      ).called(1);
    });

    test('logs the resolved scenario name via monitoring', () async {
      final scenario = Scenario('my_scenario', [_matchAll]);
      when(
        () => repository.getActiveScenario(fallback: any(named: 'fallback')),
      ).thenReturn(scenario);
      when(() => handler.isCompleted).thenReturn(true);
      when(() => handler.resolve(any(), any())).thenAnswer((_) {});

      await interceptor.onRequest(RequestOptions(), handler);

      final captured = verify(
        () => monitoring.debug(captureAny(), name: 'mocked_be'),
      ).captured;
      check(captured.single as String).contains('my_scenario');
    });

    test('resolves with raw string for plain response type', () async {
      final scenario = Scenario('test', [_matchAll]);
      when(
        () => repository.getActiveScenario(fallback: any(named: 'fallback')),
      ).thenReturn(scenario);
      when(() => handler.isCompleted).thenReturn(true);
      when(() => handler.resolve(any(), any())).thenAnswer((_) {});

      await interceptor.onRequest(
        RequestOptions(responseType: ResponseType.plain),
        handler,
      );

      final captured = verify(
        () => handler.resolve(captureAny(), any()),
      ).captured;
      check((captured.single as Response<dynamic>).data).isA<String>();
    });

    test('rejects with unknown DioException when handler throws non-Dio exception',
        () async {
      final scenario = Scenario('test', [
        RequestHandler((_) => true, sendException(Exception('boom'))),
      ]);
      when(
        () => repository.getActiveScenario(fallback: any(named: 'fallback')),
      ).thenReturn(scenario);
      when(() => handler.isCompleted).thenReturn(true);
      when(() => handler.reject(any())).thenAnswer((_) {});

      await interceptor.onRequest(RequestOptions(), handler);

      final captured = verify(
        () => handler.reject(captureAny()),
      ).captured;
      final error = captured.single as DioException;
      check(error.type).equals(DioExceptionType.unknown);
      check(error.response).isNull();
    });

    test('rejects with the original DioException when handler throws one',
        () async {
      final original = DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.sendTimeout,
      );
      final scenario = Scenario('test', [
        RequestHandler((_) => true, sendException(original)),
      ]);
      when(
        () => repository.getActiveScenario(fallback: any(named: 'fallback')),
      ).thenReturn(scenario);
      when(() => handler.isCompleted).thenReturn(true);
      when(() => handler.reject(any())).thenAnswer((_) {});

      await interceptor.onRequest(RequestOptions(), handler);

      final captured = verify(
        () => handler.reject(captureAny()),
      ).captured;
      final error = captured.single as DioException;
      check(error.type).equals(DioExceptionType.sendTimeout);
    });
  });
}
