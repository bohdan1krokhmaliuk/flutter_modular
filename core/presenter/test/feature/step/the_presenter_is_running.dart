import 'package:bdd_steps/initalization.dart';
import 'package:design_system/design_system.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presenter/src/presentation/presenter.dart';

import '../../mocks/mocks.dart';

/// Usage: the presenter is running
Future<void> thePresenterIsRunning(WidgetTester tester) async => testInit(
  tester,
  () => Scaffold(
    body: BlocProvider<FakeFeatureBloc>(
      create: (context) => diContainer<FakeFeatureBloc>(),
      child: Presenter<FakeFeatureBloc, FakeState, FakePresentation>(
        builder: (context, presentation) =>
            Toast.of(context).show('My custom presentation'),
        child: const SizedBox(),
      ),
    ),
  ),
  initializer: DIInitializer(
    (_getIt, _) => _getIt.registerSingleton<FakeFeatureBloc>(FakeFeatureBloc()),
  ),
);
