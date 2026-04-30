import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:monitoring/monitoring.dart';

@lazySingleton
class ApiMonitoringInterceptor extends Interceptor {
  const ApiMonitoringInterceptor({required Monitoring monitoring})
    : _monitoring = monitoring;

  final Monitoring _monitoring;
  static const _name = 'api';
  static const _body = 'BODY:';
  static const _headers = 'HEADERS:';
  static const _statusCode = 'STATUS CODE:';
  static const _requestHeader = '[REQUEST]:';
  static const _responseHeader = '[RESPONSE]:';
  static const _responseErrHeader = '[RESPONSE ERROR 🚨]:';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = options.headers.entries.join('\n');
    _monitoring.debug(
      '$_requestHeader ${options.method} ${options.uri.path}\n'
      '$_headers\n$headers',
      name: _name,
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final request = response.requestOptions;
    _monitoring.debug(
      '$_responseHeader'
      '${request.method} ${request.uri.path}\n'
      '$_statusCode ${response.statusCode}\n'
      '$_headers\n${response.headers}'
      '$_body ${response.data}',
      name: _name,
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _monitoring.recordNonFatal(
      err,
      stackTrace: StackTrace.current,
      name: _name,
      description:
          '$_responseErrHeader'
          '${err.requestOptions.method} ${err.requestOptions.uri.path}\n'
          '$_statusCode ${err.response?.statusCode}\n'
          '$_body ${err.response?.data}',
    );

    super.onError(err, handler);
  }
}
