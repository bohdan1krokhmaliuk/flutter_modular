import 'package:injectable/injectable.dart';
import 'package:prelude/prelude.dart';
import 'package:questionnaire/src/domain/api/questions_api.dart';
import 'package:questionnaire/src/domain/model/question.dart';

@injectable
class QuestionsRepository {
  const QuestionsRepository(this._api);

  final QuestionnaireApi _api;

  Future<Result<List<Question>, FailureException>> load() =>
      Result.fromAsync(() => _api.load());

  Future<Result<void, FailureException>> submit(List<String> answerIds) =>
      Result.fromAsync(() => _api.submit(answerIds));
}
