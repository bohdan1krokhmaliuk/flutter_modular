import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:mocked_be/core.dart';
import 'package:questionnaire/src/domain/api/model/validation.dart';
import 'package:questionnaire/src/domain/model/answer.dart';
import 'package:questionnaire/src/domain/model/question.dart';

final successScenario = Scenario('successScenario', [
  RequestHandler(
    multiMatcherAnd([hasMethod('GET'), hasPath('/questions')]),
    sendSuccess(
      jsonEncode(
        ListResponse(data: _questions, meta: null).toJson((q) => q.toJson()),
      ),
    ),
  ),
  RequestHandler(
    multiMatcherAnd([
      hasMethod('POST'),
      hasPath('/questions'),
      hasQueryParams({
        'answers': ['a1', 'a3'].toString(),
      }),
    ]),
    sendSuccess(jsonEncode(Validation(isCorrect: true).toJson())),
  ),
  RequestHandler(
    multiMatcherAnd([hasMethod('POST'), hasPath('/questions')]),
    sendSuccess(jsonEncode(Validation(isCorrect: false).toJson())),
  ),
]);

final failureQuestionsScenario = Scenario('failureQuestionsScenario', [
  RequestHandler(
    multiMatcherAnd([hasMethod('GET'), hasPath('/questions')]),
    sendError(500),
  ),
  ...successScenario.handlers,
]);

final failureAnswersScenario = Scenario('failureAnswersScenario', [
  RequestHandler(
    multiMatcherAnd([hasMethod('POST'), hasPath('/questions')]),
    sendError(500),
  ),
  ...successScenario.handlers,
]);

const _questions = [
  Question(
    content: '2 + 2 =',
    id: 'q1',
    answers: [
      Answer(id: 'a1', content: '4', nextQuestion: 'q2'),
      Answer(id: 'a2', content: '13', nextQuestion: 'q2'),
    ],
  ),
  Question(
    content: 'General question',
    id: 'q2',
    answers: [
      Answer(id: 'a3', content: 'Correct answer'),
      Answer(id: 'a4', content: 'Invalid answer'),
    ],
  ),
];
