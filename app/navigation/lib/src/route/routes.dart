import 'package:auto_route/auto_route.dart';
import 'package:navigation/src/router/router.dart';
import 'package:rick_and_morty_characters/rick_and_morty_characters.dart';

part 'route_wrapper.dart';

final List<AutoRoute> featureRoutes = [_charactersRoute];

final _charactersRoute = AutoRoute(
  path: '/characters',
  page: CharactersRoute.page,
  initial: true,
);
