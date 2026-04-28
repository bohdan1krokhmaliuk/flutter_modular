import 'package:mocked_be/src/core/request.dart';
import 'package:mocked_be/src/core/request_matcher.dart';
import 'package:mocked_be/src/core/response_error.dart';
import 'package:prelude/prelude.dart';

typedef RequestAction =
    Future<Result<String, ResponseError>> Function(Request request);

class RequestHandler {
  const RequestHandler(this._matcher, this.action);

  final RequestMatcher _matcher;
  final RequestAction action;

  Future<Result<String, ResponseError>>? handle(Request request) {
    if (!_matcher(request)) {
      return null;
    }
    return action(request);
  }
}

RequestAction sendSuccess(String responseBody, {Duration? delay}) =>
    (r) => Future.delayed(
      delay ?? Duration.zero,
    ).then((_) => success(responseBody));

RequestAction sendError(
  int statusCode, {
  String responseBody = '{}',
  Map<String, String> headers = const {},
}) =>
    (_) => Future.value(
      failure(
        ResponseErrorWithBody(statusCode, responseBody, headers: headers),
      ),
    );

RequestAction sendException(Exception exception) =>
    (_) => Future.value(failure(ResponseErrorWithException(exception)));

List<int> _requestsCount = [];
RequestAction sendMultiple(
  List<Result<String, ResponseError>> responses, {
  Duration? delay,
}) {
  final uniqueId = _requestsCount.length;
  _requestsCount.add(0);
  return (_) => Future<void>.delayed(delay ?? Duration.zero).then((_) {
    final times = _requestsCount[uniqueId]++;
    return responses.elementAtOrNull(times) ?? responses.last;
  });
}
