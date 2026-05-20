import 'package:checks/checks.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocked_be/core.dart';

Request _makeRequest({
  String method = 'GET',
  String path = '/api',
  Map<String, dynamic>? queryParams,
  Map<String, dynamic>? headers,
}) => Request.fromOptions(
  RequestOptions(
    method: method,
    path: path,
    queryParameters: queryParams ?? {},
    headers: headers ?? {},
  ),
);

void main() {
  group('hasMethod', () {
    test('matches when method equals (case-insensitive)', () {
      final matcher = hasMethod('GET');

      check(matcher(_makeRequest(method: 'get'))).isTrue();
    });

    test('rejects when method differs', () {
      final matcher = hasMethod('POST');

      check(matcher(_makeRequest())).isFalse();
    });
  });

  group('hasPath', () {
    test('matches when path equals (case-insensitive)', () {
      final matcher = hasPath('/api/users');

      check(matcher(_makeRequest(path: '/API/Users'))).isTrue();
    });

    test('rejects when path differs', () {
      final matcher = hasPath('/api/users');

      check(matcher(_makeRequest(path: '/api/posts'))).isFalse();
    });
  });

  group('hasQueryParams', () {
    test('matches when all specified params are present', () {
      final matcher = hasQueryParams({'page': '1', 'limit': '10'});
      final request = _makeRequest(
        queryParams: {'page': '1', 'limit': '10', 'extra': 'y'},
      );

      check(matcher(request)).isTrue();
    });

    test('rejects when a param has wrong value', () {
      final matcher = hasQueryParams({'page': '2'});

      check(matcher(_makeRequest(queryParams: {'page': '1'}))).isFalse();
    });

    test('rejects when a required param is missing', () {
      final matcher = hasQueryParams({'page': '1'});

      check(matcher(_makeRequest(queryParams: {}))).isFalse();
    });
  });

  group('hasHeaders', () {
    test('matches when all specified headers are present', () {
      final matcher = hasHeaders({'Authorization': 'Bearer token'});
      final request = _makeRequest(
        headers: {'Authorization': 'Bearer token', 'x-extra': 'y'},
      );

      check(matcher(request)).isTrue();
    });

    test('rejects when a header has wrong value', () {
      final matcher = hasHeaders({'Authorization': 'Bearer abc'});

      check(
        matcher(_makeRequest(headers: {'Authorization': 'Bearer xyz'})),
      ).isFalse();
    });

    test('rejects when a required header is missing', () {
      final matcher = hasHeaders({'Authorization': 'Bearer token'});

      check(matcher(_makeRequest(headers: {}))).isFalse();
    });
  });

  group('multiMatcherAnd', () {
    test('returns true when all matchers pass', () {
      final matcher = multiMatcherAnd([hasMethod('GET'), hasPath('/api')]);

      check(matcher(_makeRequest())).isTrue();
    });

    test('returns false when any matcher fails', () {
      final matcher = multiMatcherAnd([hasMethod('GET'), hasPath('/api')]);

      check(matcher(_makeRequest(method: 'POST'))).isFalse();
    });

    test('returns true for empty matcher list', () {
      final matcher = multiMatcherAnd([]);

      check(matcher(_makeRequest())).isTrue();
    });
  });

  group('multiMatcherOr', () {
    test('returns true when at least one matcher passes', () {
      // hasMethod('POST') fails, hasPath('/api') passes
      final matcher = multiMatcherOr([hasMethod('POST'), hasPath('/api')]);

      check(matcher(_makeRequest())).isTrue();
    });

    test('returns false when no matchers pass', () {
      final matcher = multiMatcherOr([hasMethod('POST'), hasPath('/other')]);

      check(matcher(_makeRequest())).isFalse();
    });

    test('returns false for empty matcher list', () {
      final matcher = multiMatcherOr([]);

      check(matcher(_makeRequest())).isFalse();
    });
  });
}
