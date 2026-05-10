import 'dart:async';

import 'package:di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:questionnaire/src/di/di_initializer.config.dart';

class QuestionnaireDIInitializer extends DIInitializer {
  const QuestionnaireDIInitializer() : super(_init);
}

@diInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);
