import 'package:mocked_be/src/core/request.dart';

typedef RequestMatcher = bool Function(Request requset);

RequestMatcher hasMethod(String method) =>
    (r) => r.method.toUpperCase() == method.toUpperCase();

RequestMatcher hasPath(String path) =>
    (r) => r.path.toLowerCase() == path.toLowerCase();

RequestMatcher hasQueryParams(Map<String, String> query) =>
    (r) => query.keys.every((k) => r.queryParams?[k] == query[k]);

RequestMatcher hasHeaders(Map<String, String> headers) =>
    (r) => headers.keys.every((k) => r.headers?[k] == headers[k]);

RequestMatcher multiMatcherAnd(List<RequestMatcher> matchers) =>
    (r) => matchers.fold(true, (value, matcher) => value && matcher(r));

RequestMatcher multiMatcherOr(List<RequestMatcher> matchers) =>
    (r) => matchers.fold(true, (value, matcher) => value || matcher(r));
