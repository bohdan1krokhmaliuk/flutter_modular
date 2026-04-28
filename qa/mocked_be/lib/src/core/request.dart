import 'package:dio/dio.dart';

class Request {
  Request._(this.method, this.path, this.queryParams, this.headers, this.body);

  factory Request.fromOptions(RequestOptions options) => Request._(
    options.method,
    options.path,
    options.queryParameters.map((k, v) => MapEntry(k, v.toString())),
    options.headers.map((k, v) => MapEntry(k, v.toString())),
    options.data,
  );

  final String method;
  final String path;
  final Map<String, String>? queryParams;
  final Map<String, String>? headers;
  final dynamic body;
}
