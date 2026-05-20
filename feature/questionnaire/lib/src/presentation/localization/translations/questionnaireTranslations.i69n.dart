// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
// dart format off
import 'package:i69n/i69n.dart' as i69n;

String get _languageCode => 'en';
String get _localeName => 'en';

String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class QuestionnaireTranslations implements i69n.I69nMessageBundle {
  const QuestionnaireTranslations();
  WelcomeQuestionnaireTranslations get welcome =>
      WelcomeQuestionnaireTranslations(this);
  CompletedQuestionnaireTranslations get completed =>
      CompletedQuestionnaireTranslations(this);
  Object operator [](String key) {
    throw Exception(
        '[] operator is disabled in en, see _i69n: nomap, notraverse flag.');
  }
}

class WelcomeQuestionnaireTranslations implements i69n.I69nMessageBundle {
  final QuestionnaireTranslations _parent;
  const WelcomeQuestionnaireTranslations(this._parent);
  String get pageTitle => "Check your knowledge";
  String get button => "Start quiz";
  String get title => "Ready to test your knowledge?";
  String get description =>
      "Welcome to the quiz! These questions are designed to help you reinforce what you've learned and discover new insights. Take your time and focus on the details. Good luck";
  Object operator [](String key) {
    throw Exception(
        '[] operator is disabled in en.welcome, see _i69n: nomap, notraverse flag.');
  }
}

class CompletedQuestionnaireTranslations implements i69n.I69nMessageBundle {
  final QuestionnaireTranslations _parent;
  const CompletedQuestionnaireTranslations(this._parent);
  String title(bool isSuccess) =>
      "${isSuccess ? 'Fantastic Job! 🎉' : 'Not Quite There Yet ✨'}";
  String description(bool isSuccess) =>
      "${isSuccess ? '$_descriptionSuccess' : '$_descriptionFailure'}";
  String get _descriptionSuccess =>
      "You've successfully completed the quiz! You've shown great dedication and a solid grasp of the material. Take a moment to celebrate your progress—you've earned it!";
  String get _descriptionFailure =>
      "Good effort! You've completed the session, but there's still room to grow. Review your results below and give it another shot whenever you're ready.";
  Object operator [](String key) {
    throw Exception(
        '[] operator is disabled in en.completed, see _i69n: nomap, notraverse flag.');
  }
}
