import 'package:injectable/injectable.dart';
import 'package:prelude/prelude.dart';
import 'package:questionnaire/src/domain/api/questionnaire_api.dart';
import 'package:questionnaire/src/domain/model/question.dart';

@injectable
class QuestionsRepository {
  const QuestionsRepository(this._api);

  final QuestionnaireApi _api;

  Future<Result<List<Question>, FailureException>> load() async {
    final result = await Result.fromAsync(_api.getQuestions);
    return result.map((s) => s.data);
  }

  Future<Result<bool, FailureException>> submit(List<String> answerIds) async {
    final result = await Result.fromAsync(() => _api.checkAnswers(answerIds));
    return result.map((s) => s.isCorrect);
  }
}
