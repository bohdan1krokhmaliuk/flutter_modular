import 'dart:async';

import 'package:di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_characters/src/di/di_initializer.config.dart';

class RickAndMortyCharactersDIInitializer extends DIInitializer {
  const RickAndMortyCharactersDIInitializer() : super(_init);
}

@diInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);
