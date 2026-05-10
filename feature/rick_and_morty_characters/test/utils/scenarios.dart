import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:mocked_be/core.dart';
import 'package:rick_and_morty_characters/src/domain/model/character.dart';

// [HINT] sendMultiple caches current index
// so u don't really want to reuse same scenario object containing sendMultiple
Scenario get failureScenario => Scenario('failure', [
  RequestHandler(
    hasPath('/character'),
    sendMultiple([
      sendError(500),
      sendSuccess(_generatePage(0)),
      sendSuccess(_generatePage(1)),
    ]),
  ),
]);

Scenario successScenario = Scenario('successScenario', [
  RequestHandler(
    hasPath('/character'),
    sendMultiple([
      sendSuccess(_generatePage(0)),
      sendSuccess(_generatePage(1)),
      sendError(404),
    ]),
  ),
]);

Scenario successContentScenario = Scenario('successScenario', [
  RequestHandler(
    hasPath('/character'),
    sendSuccess(
      jsonEncode(
        ListResponse<Character>(
          data: [
            _character.copyWith(name: 'Woman', gender: Gender.female),
            _character.copyWith(name: 'Man', gender: Gender.male),
            _character.copyWith(name: 'Alien', gender: Gender.genderless),
            _character.copyWith(name: 'Unknown', gender: Gender.unknown),
          ],
          meta: const PaginationData(count: 10, pages: 1),
        ).toJson((c) => c.toJson()),
      ),
    ),
  ),
]);

String _generatePage(int page) {
  final startIndex = page * 10;
  return jsonEncode(
    ListResponse<Character>(
      data: List.generate(
        10,
        (i) => _character.copyWith(name: 'Character ${startIndex + i}'),
      ),
      meta: PaginationData(count: 10, pages: page + 1),
    ).toJson((c) => c.toJson()),
  );
}

const _character = Character(
  id: 0,
  name: 'Character 1',
  image: 'image',
  origin: _location,
  species: 'species',
  location: _location,
  status: Status.alive,
  gender: Gender.female,
);
const _location = ShortLocation(name: 'Test location');
