import 'package:injectable/injectable.dart';
import 'package:prelude/prelude.dart';
import 'package:rick_and_morty_characters/src/domain/api/characters_api.dart';
import 'package:rick_and_morty_characters/src/domain/model/character.dart';

@injectable
class CharactersRepository {
  const CharactersRepository(this._api);

  final CharactersApi _api;

  Future<Result<List<Character>, FailureException>> getCharacters(
    int page,
  ) async {
    final result = await Result.fromAsync(() => _api.getCharacters(page));
    return result.map((s) => s.data);
  }
}
