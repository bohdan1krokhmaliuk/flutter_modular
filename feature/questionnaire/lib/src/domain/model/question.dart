import 'package:questionnaire/src/domain/model/answer.dart';

class Question {
  const Question({
    required this.id,
    required this.content,
    required this.answers,
    this.next,
  });

  final String id;
  final String content;
  final String? next;
  final List<Answer> answers;
}
