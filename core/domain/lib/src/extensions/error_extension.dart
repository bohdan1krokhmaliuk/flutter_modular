import 'package:dio/dio.dart';
import 'package:platform_info/platform_info.dart';
import 'package:prelude/prelude.dart';

extension FailureExceptionX on FailureException {
  T mapDioException<T>(T Function(DioException? exception) builder) =>
      builder(inner is DioException ? (inner as DioException) : null);

  bool get isNotFoundException =>
      mapDioException((e) => e?.response?.statusCode == HttpStatus.notFound);
}
