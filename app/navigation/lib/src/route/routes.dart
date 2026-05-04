import 'package:auto_route/auto_route.dart';
import 'package:navigation/src/router/router.dart';
import 'package:questionnaire/questionnaire.dart';
import 'package:rick_and_morty_characters/rick_and_morty_characters.dart';
import 'package:sandbox/sandbox.dart';

part 'route_wrapper.dart';

final List<AutoRoute> featureRoutes = [
  _sandboxRoute,
  _charactersRoute,
  _questionnaireRoute,
];

final _sandboxRoute = AutoRoute(
  path: '/sandbox',
  page: SandboxRoute.page,
  initial: true,
);

final _charactersRoute = AutoRoute(
  path: '/characters',
  page: CharactersRoute.page,
);

final _questionnaireRoute = AutoRoute(
  path: '/questionnaire',
  page: QuestionnaireRoute.page,
);
