import 'dart:async';
import 'dart:convert' show jsonDecode, jsonEncode;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mocked_be/src/core/request.dart';
import 'package:mocked_be/src/core/response_error.dart';
import 'package:mocked_be/src/core/scenario.dart';
import 'package:mocked_be/src/repository/scenario_repository.dart';

// [HINT] Though this interceptor mainly serve purpose for bdd setup
// it can also be implemented in app for mocking real requests for demo purposes
@injectable
class MockedBeInterceptor extends Interceptor {
  MockedBeInterceptor(this._scenarioRepository);

  final ScenarioRepository _scenarioRepository;

  final _jsonRegex = RegExp('*(application/).*(json)');

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final scenario = _scenarioRepository.getActiveScenario();
    if (scenario != null) {
      await _handleMockedRequest(options, handler, scenario);
    }
    if (!handler.isCompleted) {
      super.onRequest(options, handler);
    }
  }

  FutureOr<void> _handleMockedRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
    Scenario scenario,
  ) async {
    if (Platform.environment.containsKey('FLUTTER_TEST') ||
        Platform.environment.containsKey('FLUTTER_INTEGRATION_TEST')) {
      _requestEncodabilityCheck(options);
    }

    final request = Request.fromOptions(options);

    for (final h in scenario.handlers) {
      final result = await h.handle(request);
      if (result != null) {
        return result.fold(
          (s) => handler.resolve(
            Response<dynamic>(
              requestOptions: options,
              data: _convertResponse(s, options.responseType),
            ),
            true,
          ),
          (f) {
            final response = f is ResponseErrorWithBody
                ? Response<dynamic>(
                    requestOptions: options,
                    statusCode: f.statusCode,
                    data: _convertResponse(f.errorBody, options.responseType),
                    headers: Headers.fromMap(
                      f.headers.map((k, v) => MapEntry(k, [v])),
                    ),
                  )
                : null;

            final error = f.getException() is DioException
                ? f.getException() as DioException
                : DioException(
                    response: response,
                    requestOptions: options,
                    error: f.getException(),
                    type: response != null
                        ? DioExceptionType.badResponse
                        : DioExceptionType.unknown,
                  );

            return handler.reject(error);
          },
        );
      }
    }
  }

  dynamic _convertResponse(String data, ResponseType type) => switch (type) {
    ResponseType.json || ResponseType.bytes => jsonDecode(data),
    _ => data,
  };

  /// Fails test if json request can not be encoded
  void _requestEncodabilityCheck(RequestOptions request) {
    if (request.data == null) {
      return;
    }

    if (request.contentType case final type? when _jsonRegex.hasMatch(type)) {
      jsonEncode(request.data);
    }
  }
}
