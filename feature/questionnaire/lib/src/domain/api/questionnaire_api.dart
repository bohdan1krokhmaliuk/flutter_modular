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

// TODO: delete
// @injectable
// class QuestionnaireApi {
//   const QuestionnaireApi();

//   Future<List<Question>> load() async =>
//       Future.delayed(const Duration(milliseconds: 500), () => _questions);

//   Future<void> submit(List<String> answerIds) async {
//     await Future.delayed(const Duration(milliseconds: 300));

//     const validAnswersPacks = [
//       ['q2_a2', 'q3_a1', 'q4_a3', 'q5_a2'],
//       ['q6_a1', 'q7_a2', 'q8_a1', 'q9_a3'],
//     ];

//     for (final valid in validAnswersPacks) {
//       if (valid.every(answerIds.contains)) {
//         return;
//       }
//     }

//     throw FailureException('incorrect');
//   }
// }

// const _questions = [
//   Question(
//     id: 'q1',
//     content: 'Which subject area interests you more?',
//     answers: [
//       Answer(id: 'q1_a1', content: 'History & Culture', nextQuestion: 'q2'),
//       Answer(id: 'q1_a2', content: 'Science & Nature', nextQuestion: 'q6'),
//     ],
//   ),
//   Question(
//     id: 'q2',
//     content:
//         'Who was the military leader who conquered much of Europe in the early 1800s?',
//     answers: [
//       Answer(id: 'q2_a1', content: 'Alexander the Great', nextQuestion: 'q3'),
//       Answer(id: 'q2_a2', content: 'Napoleon Bonaparte', nextQuestion: 'q3'),
//       Answer(id: 'q2_a3', content: 'Julius Caesar', nextQuestion: 'q3'),
//     ],
//   ),
//   Question(
//     id: 'q3',
//     content:
//         'In which ancient civilization was the Great Pyramid of Giza built?',
//     answers: [
//       Answer(id: 'q3_a1', content: 'Ancient Egypt', nextQuestion: 'q4'),
//       Answer(id: 'q3_a2', content: 'Ancient Mesopotamia', nextQuestion: 'q4'),
//       Answer(id: 'q3_a3', content: 'Ancient Greece', nextQuestion: 'q4'),
//       Answer(id: 'q3_a4', content: 'Ancient Rome', nextQuestion: 'q4'),
//     ],
//   ),
//   Question(
//     id: 'q4',
//     content:
//         'What period in Europe was marked by a revival of classical art and learning?',
//     answers: [
//       Answer(id: 'q4_a1', content: 'Middle Ages', nextQuestion: 'q5'),
//       Answer(id: 'q4_a2', content: 'Dark Ages', nextQuestion: 'q5'),
//       Answer(id: 'q4_a3', content: 'Renaissance', nextQuestion: 'q5'),
//     ],
//   ),
//   Question(
//     id: 'q5',
//     content: 'On which river was Paris originally built?',
//     answers: [
//       Answer(id: 'q5_a1', content: 'The Rhine'),
//       Answer(id: 'q5_a2', content: 'The Seine'),
//       Answer(id: 'q5_a3', content: 'The Loire'),
//     ],
//   ),
//   Question(
//     id: 'q6',
//     content: 'What is the basic unit of life?',
//     answers: [
//       Answer(id: 'q6_a1', content: 'Cell', nextQuestion: 'q7'),
//       Answer(id: 'q6_a2', content: 'Atom', nextQuestion: 'q7'),
//       Answer(id: 'q6_a3', content: 'Molecule', nextQuestion: 'q7'),
//     ],
//   ),
//   Question(
//     id: 'q7',
//     content: 'Who discovered the structure of DNA?',
//     answers: [
//       Answer(id: 'q7_a1', content: 'Albert Einstein', nextQuestion: 'q8'),
//       Answer(id: 'q7_a2', content: 'Watson and Crick', nextQuestion: 'q8'),
//       Answer(id: 'q7_a3', content: 'Charles Darwin', nextQuestion: 'q8'),
//     ],
//   ),

//   Question(
//     id: 'q8',
//     content:
//         'What process do plants use to convert sunlight into chemical energy?',
//     answers: [
//       Answer(id: 'q8_a1', content: 'Photosynthesis', nextQuestion: 'q9'),
//       Answer(id: 'q8_a2', content: 'Respiration', nextQuestion: 'q9'),
//       Answer(id: 'q8_a3', content: 'Fermentation', nextQuestion: 'q9'),
//     ],
//   ),
//   Question(
//     id: 'q9',
//     content: 'What is the speed of light in vacuum?',
//     answers: [
//       Answer(id: 'q9_a1', content: '150,000 km/s'),
//       Answer(id: 'q9_a2', content: '250,000 km/s'),
//       Answer(id: 'q9_a3', content: '300,000 km/s'),
//     ],
//   ),
// ];
