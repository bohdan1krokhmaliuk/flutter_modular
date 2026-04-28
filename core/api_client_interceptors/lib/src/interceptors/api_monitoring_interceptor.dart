import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:monitoring/monitoring.dart';

@lazySingleton
class ApiMonitoringInterceptor extends Interceptor {
  const ApiMonitoringInterceptor({required Monitoring monitoring})
    : _monitoring = monitoring;

  final Monitoring _monitoring;
  static const _body = 'BODY:';
  static const _headers = 'HEADERS:';
  static const _statusCode = 'STATUS CODE:';
  static const _requestHeader = '[API REQUEST]:';
  static const _responseHeader = '[API RESPONSE]:';
  static const _responseErrHeader = '[API RESPONSE ERROR 🚨]:';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = options.headers.entries.join('\n');
    _monitoring.developerLog(
      '$_requestHeader ${options.method} ${options.uri.path}\n'
      '$_headers\n$headers',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final request = response.requestOptions;
    _monitoring.developerLog(
      '$_responseHeader'
      '${request.method} ${request.uri.path}\n'
      '$_statusCode ${response.statusCode}\n'
      '$_headers\n${response.headers}'
      '$_body ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _monitoring.developerLog(
      '$_responseErrHeader'
      '${err.requestOptions.method} ${err.requestOptions.uri.path}\n'
      '$_statusCode ${err.response?.statusCode}\n'
      '$_body ${err.response?.data}',
    );
    super.onError(err, handler);
  }
}
