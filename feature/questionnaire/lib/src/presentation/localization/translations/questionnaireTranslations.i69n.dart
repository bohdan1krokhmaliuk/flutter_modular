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
  WellcomeQuestionnaireTranslations get wellcome =>
      WellcomeQuestionnaireTranslations(this);
  CompletedQuestionnaireTranslations get completed =>
      CompletedQuestionnaireTranslations(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'wellcome':
        return wellcome;
      case 'completed':
        return completed;
      default:
        return key;
    }
  }
}

class WellcomeQuestionnaireTranslations implements i69n.I69nMessageBundle {
  final QuestionnaireTranslations _parent;
  const WellcomeQuestionnaireTranslations(this._parent);
  String get pageTitle => "Check your knowledge";
  String get button => "Start quiz";
  String get title => "Ready to test your knowledge?";
  String get description =>
      "Welcome to the quiz! These questions are designed to help you reinforce what you've learned and discover new insights. Take your time and focus on the details. Good luck";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'pageTitle':
        return pageTitle;
      case 'button':
        return button;
      case 'title':
        return title;
      case 'description':
        return description;
      default:
        return key;
    }
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
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'description':
        return description;
      case '_descriptionSuccess':
        return _descriptionSuccess;
      case '_descriptionFailure':
        return _descriptionFailure;
      default:
        return key;
    }
  }
}
