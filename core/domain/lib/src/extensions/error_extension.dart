import 'dart:io';

import 'package:dio/dio.dart';
import 'package:prelude/prelude.dart';

extension FailureExceptionX on FailureException {
  bool get isNotFoundException =>
      inner is DioException &&
      (inner as DioException).response?.statusCode == HttpStatus.notFound;
}
