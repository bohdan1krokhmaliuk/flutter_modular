import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty_characters/src/domain/model/character.dart';

part 'characters_api.g.dart';

@injectable
@RestApi()
abstract class CharactersApi {
  @factoryMethod
  factory CharactersApi(Dio dio) = _CharactersApi;

  @authenticatedApiRequest
  @GET('/character')
  Future<ListResponse<Character>> getCharacters(@Query('page') int page);
}
