import 'package:mocked_be/core.dart';

Scenario alwaysFailureScenario = Scenario('alwaysFailure', [
  RequestHandler(hasPath('/uri/invalid'), sendError(500)),
  RequestHandler(hasPath('/uri/no_token'), sendError(404)),
]);
