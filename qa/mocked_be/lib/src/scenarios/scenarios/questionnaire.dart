part of '../scenarios.dart';

final _questionnaire = Scenario('questionnaire', [
  RequestHandler(
    multiMatcherAnd([hasMethod('GET'), hasPath('/questions')]),
    sendSuccess(
      '{"results":[{"id":"q1","content":"Which subject area interests you more?","answers":[{"id":"q1_a1","content":"History & Culture","nextQuestion":"q2"},{"id":"q1_a2","content":"Science & Nature","nextQuestion":"q6"}]},{"id":"q2","content":"Who was the military leader who conquered much of Europe in the early 1800s?","answers":[{"id":"q2_a1","content":"Alexander the Great","nextQuestion":"q3"},{"id":"q2_a2","content":"Napoleon Bonaparte","nextQuestion":"q3"},{"id":"q2_a3","content":"Julius Caesar","nextQuestion":"q3"}]},{"id":"q3","content":"In which ancient civilization was the Great Pyramid of Giza built?","answers":[{"id":"q3_a1","content":"Ancient Egypt","nextQuestion":"q4"},{"id":"q3_a2","content":"Ancient Mesopotamia","nextQuestion":"q4"},{"id":"q3_a3","content":"Ancient Greece","nextQuestion":"q4"},{"id":"q3_a4","content":"Ancient Rome","nextQuestion":"q4"}]},{"id":"q4","content":"What period in Europe was marked by a revival of classical art and learning?","answers":[{"id":"q4_a1","content":"Middle Ages","nextQuestion":"q5"},{"id":"q4_a2","content":"Dark Ages","nextQuestion":"q5"},{"id":"q4_a3","content":"Renaissance","nextQuestion":"q5"}]},{"id":"q5","content":"On which river was Paris originally built?","answers":[{"id":"q5_a1","content":"The Rhine","nextQuestion":null},{"id":"q5_a2","content":"The Seine","nextQuestion":null},{"id":"q5_a3","content":"The Loire","nextQuestion":null}]},{"id":"q6","content":"What is the basic unit of life?","answers":[{"id":"q6_a1","content":"Cell","nextQuestion":"q7"},{"id":"q6_a2","content":"Atom","nextQuestion":"q7"},{"id":"q6_a3","content":"Molecule","nextQuestion":"q7"}]},{"id":"q7","content":"Who discovered the structure of DNA?","answers":[{"id":"q7_a1","content":"Albert Einstein","nextQuestion":"q8"},{"id":"q7_a2","content":"Watson and Crick","nextQuestion":"q8"},{"id":"q7_a3","content":"Charles Darwin","nextQuestion":"q8"}]},{"id":"q8","content":"What process do plants use to convert sunlight into chemical energy?","answers":[{"id":"q8_a1","content":"Photosynthesis","nextQuestion":"q9"},{"id":"q8_a2","content":"Respiration","nextQuestion":"q9"},{"id":"q8_a3","content":"Fermentation","nextQuestion":"q9"}]},{"id":"q9","content":"What is the speed of light in vacuum?","answers":[{"id":"q9_a1","content":"150,000 km/s","nextQuestion":null},{"id":"q9_a2","content":"250,000 km/s","nextQuestion":null},{"id":"q9_a3","content":"300,000 km/s","nextQuestion":null}]}]}',
    ),
  ),
  RequestHandler(multiMatcherAnd([hasMethod('POST'), hasPath('/questions')]), (
    r,
  ) async {
    final answerIds = r.queryParams?['answers'] ?? '';

    const validAnswersPacks = [
      ['q2_a2', 'q3_a1', 'q4_a3', 'q5_a2'],
      ['q6_a1', 'q7_a2', 'q8_a1', 'q9_a3'],
    ];

    for (final valid in validAnswersPacks) {
      if (valid.every(answerIds.contains)) {
        return success('{"isCorrect": true}');
      }
    }

    return success('{"isCorrect": false}');
  }),
]);
