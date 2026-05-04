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

class CommonTranslations implements i69n.I69nMessageBundle {
  const CommonTranslations();
  ButtonCommonTranslations get button => ButtonCommonTranslations(this);
  ErrorCommonTranslations get error => ErrorCommonTranslations(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'button':
        return button;
      case 'error':
        return error;
      default:
        return key;
    }
  }
}

class ButtonCommonTranslations implements i69n.I69nMessageBundle {
  final CommonTranslations _parent;
  const ButtonCommonTranslations(this._parent);
  String get yes => "Yes";
  String get no => "No";
  String get ok => "OK";
  String get retry => "Retry";
  String get tryAgain => "Try again";
  String get clear => "Clear";
  String get close => "Close";
  String get delete => "Delete";
  String get save => "Save";
  String get skip => "Skip";
  String get more => "More";
  String get submit => "Submit";
  String get apply => "Apply";
  String get accept => "Accept";
  String get discard => "Discard";
  String get next => "Next";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'yes':
        return yes;
      case 'no':
        return no;
      case 'ok':
        return ok;
      case 'retry':
        return retry;
      case 'tryAgain':
        return tryAgain;
      case 'clear':
        return clear;
      case 'close':
        return close;
      case 'delete':
        return delete;
      case 'save':
        return save;
      case 'skip':
        return skip;
      case 'more':
        return more;
      case 'submit':
        return submit;
      case 'apply':
        return apply;
      case 'accept':
        return accept;
      case 'discard':
        return discard;
      case 'next':
        return next;
      default:
        return key;
    }
  }
}

class ErrorCommonTranslations implements i69n.I69nMessageBundle {
  final CommonTranslations _parent;
  const ErrorCommonTranslations(this._parent);
  String get smthWentWrong => "Something went wrong!";
  String get smthWentWrongTryAgain => "Something went wrong. Please try again!";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'smthWentWrong':
        return smthWentWrong;
      case 'smthWentWrongTryAgain':
        return smthWentWrongTryAgain;
      default:
        return key;
    }
  }
}
