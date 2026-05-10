import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:questionnaire/src/domain/api/model/validation.dart';
import 'package:questionnaire/src/domain/model/question.dart';
import 'package:retrofit/retrofit.dart';

part 'questionnaire_api.g.dart';

@injectable
@RestApi()
abstract class QuestionnaireApi {
  @factoryMethod
  factory QuestionnaireApi(Dio dio) = _QuestionnaireApi;

  @authenticatedApiRequest
  @MockedWithScenario('questionnaire')
  @GET('/questions')
  Future<ListResponse<Question>> getQuestions();

  @authenticatedApiRequest
  @MockedWithScenario('questionnaire')
  @POST('/questions')
  Future<Validation> checkAnswers(@Query('answers') List<String> answers);
}
