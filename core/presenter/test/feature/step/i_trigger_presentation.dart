import 'package:bdd_steps/step/interactions/i_wait.dart';
import 'package:di/di.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prelude/prelude.dart';
import 'package:presenter/src/presentation/models/presentation.dart';

import '../../mocks/mocks.dart';

/// Usage: I trigger presentation {unknownError: true}
Future<void> iTriggerPresentation(
  WidgetTester tester, {
  bool unknownError = false,
  bool custom = false,
  bool confetti = false,
}) async {
  final bloc = diContainer<FakeFeatureBloc>();
  if (unknownError) {
    bloc.add(MockEvent(Presentation.error(FailureException('unknown'))));
    await iWait(tester);
  }
  if (confetti) {
    bloc.add(MockEvent(Presentation.confetti()));
    await tester.pump(const Duration(milliseconds: 50));
  }
  if (custom) {
    bloc.add(MockEvent(FakePresentation()));
    await iWait(tester);
  }
}
