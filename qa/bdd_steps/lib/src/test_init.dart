import 'dart:async';

import 'package:bdd_steps/src/di/test_app_initializer.dart';
import 'package:bdd_steps/src/test_app.dart';
import 'package:bdd_steps/step/be/the_be_is_mocked_with_scenario.dart';
import 'package:bdd_steps/step/interactions/i_wait.dart';
import 'package:di/di.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocked_be/core.dart';

Future<void> testInit<T>(
  WidgetTester tester,
  Widget Function() builder, {
  DIInitializer? initializer,
  FutureOr<void> Function()? postDi,
  FutureOr<void> Function()? tearDown,
  ValueSetter<T?>? onComplete,
  bool waitForSettle = true,
  Scenario? scenario,
}) async {
  await initializeDIContainer(
    DIInitializer.combined([?initializer, testAppInitializer]),
  );
  await theBeIsMockedWithScenario(tester, scenario);

  await postDi?.call();

  await tester.pumpWidget(TestApp<T>(builder: builder, onComplete: onComplete));

  if (waitForSettle) {
    await iWait(tester);
  }

  await tearDown?.call();
}
