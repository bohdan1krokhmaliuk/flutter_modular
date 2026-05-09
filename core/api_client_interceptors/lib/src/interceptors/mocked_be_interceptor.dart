import 'dart:async';
import 'dart:convert' show jsonDecode;

import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mocked_be/src/core/request.dart';
import 'package:mocked_be/src/core/response_error.dart';
import 'package:mocked_be/src/core/scenario.dart';
import 'package:mocked_be/src/repository/scenario_repository.dart';
import 'package:monitoring/monitoring.dart';

@lazySingleton
class MockedBeInterceptor extends Interceptor {
  MockedBeInterceptor(this._scenarioRepository, this._monitoring);

  final ScenarioRepository _scenarioRepository;
  final Monitoring _monitoring;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final scenario = _scenarioRepository.getActiveScenario(
      fallback: options.extra[ApiAttributesKeys.useMockScenario] as String?,
    );
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
    _monitoring.debug(
      'Resolving with ${scenario.name} scenario',
      name: 'mocked_be',
    );

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
}
