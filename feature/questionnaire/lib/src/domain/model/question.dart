import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:questionnaire/src/domain/model/answer.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
abstract class Question with _$Question {
  const factory Question({
    required String id,
    required String content,
    required List<Answer> answers,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
