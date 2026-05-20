import 'package:api_client_interceptors/src/interceptors/api_monitoring_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monitoring/monitoring.dart';

class _MockMonitoring extends Mock implements Monitoring {}

class _MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

class _MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

class _MockErrorInterceptorHandler extends Mock
    implements ErrorInterceptorHandler {}

void main() {
  setUpAll(() {
    registerFallbackValue(RequestOptions());
    registerFallbackValue(Response<dynamic>(requestOptions: RequestOptions()));
    registerFallbackValue(DioException(requestOptions: RequestOptions()));
  });

  group('ApiMonitoringInterceptor', () {
    late _MockMonitoring monitoring;
    late ApiMonitoringInterceptor interceptor;

    setUp(() {
      monitoring = _MockMonitoring();
      interceptor = ApiMonitoringInterceptor(monitoring: monitoring);
      when(
        () => monitoring.debug(any(), name: any(named: 'name')),
      ).thenAnswer((_) {});
      when(
        () => monitoring.recordNonFatal(
          any(),
          stackTrace: any(named: 'stackTrace'),
          description: any(named: 'description'),
          name: any(named: 'name'),
        ),
      ).thenAnswer((_) {});
    });

    test('onRequest logs via debug with name api', () {
      final requestHandler = _MockRequestInterceptorHandler();
      when(() => requestHandler.next(any())).thenAnswer((_) {});
      final options = RequestOptions(method: 'GET', path: '/users');

      interceptor.onRequest(options, requestHandler);

      verify(() => monitoring.debug(any(), name: 'api')).called(1);
      verifyNever(
        () => monitoring.recordNonFatal(
          any(),
          stackTrace: any(named: 'stackTrace'),
          description: any(named: 'description'),
          name: any(named: 'name'),
        ),
      );
    });

    test('onResponse logs via debug with name api', () {
      final responseHandler = _MockResponseInterceptorHandler();
      when(() => responseHandler.next(any())).thenAnswer((_) {});
      final response = Response<dynamic>(
        requestOptions: RequestOptions(method: 'GET', path: '/users'),
        statusCode: 200,
      );

      interceptor.onResponse(response, responseHandler);

      verify(() => monitoring.debug(any(), name: 'api')).called(1);
      verifyNever(
        () => monitoring.recordNonFatal(
          any(),
          stackTrace: any(named: 'stackTrace'),
          description: any(named: 'description'),
          name: any(named: 'name'),
        ),
      );
    });

    test('onError records non-fatal with name api', () {
      final errorHandler = _MockErrorInterceptorHandler();
      when(() => errorHandler.next(any())).thenAnswer((_) {});
      final error = DioException(
        requestOptions: RequestOptions(path: '/users'),
      );

      interceptor.onError(error, errorHandler);

      verify(
        () => monitoring.recordNonFatal(
          any(),
          stackTrace: any(named: 'stackTrace'),
          description: any(named: 'description'),
          name: 'api',
        ),
      ).called(1);
      verifyNever(() => monitoring.debug(any(), name: any(named: 'name')));
    });
  });
}
