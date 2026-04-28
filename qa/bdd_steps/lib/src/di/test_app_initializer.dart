import 'package:api_client/api_client.dart';
import 'package:bdd_steps/src/mocks/mock_monitoring.dart';
import 'package:bdd_steps/src/mocks/mock_preferences.dart';
import 'package:bdd_steps/src/mocks/mock_scenario_repository.dart';
import 'package:di/di.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mocked_be/mocked_be.dart';
import 'package:monitoring/monitoring.dart';
import 'package:preferences/preferences.dart';

part 'mocks_initializer.dart';
part 'api_interceptor_initializer.dart';

final testAppInitializer = DIInitializer.combined([
  ApiClientDIInitializer(),
  _MocksInitializer(),
  _ApiInterceptorInitializer(),
]);
