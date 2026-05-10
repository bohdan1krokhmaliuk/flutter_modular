// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
// dart format off
import 'package:i69n/i69n.dart' as i69n;
import 'commonTranslations.i69n.dart';

String get _languageCode => 'en';
String get _localeName => 'en_US';

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

class CommonTranslations_en_US extends CommonTranslations {
  const CommonTranslations_en_US();
  ButtonCommonTranslations_en_US get button =>
      ButtonCommonTranslations_en_US(this);
  ErrorCommonTranslations_en_US get error =>
      ErrorCommonTranslations_en_US(this);
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
        return super[key];
    }
  }
}

class ButtonCommonTranslations_en_US extends ButtonCommonTranslations {
  final CommonTranslations_en_US _parent;
  const ButtonCommonTranslations_en_US(this._parent) : super(_parent);
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
  String get discard => "discard";
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
      default:
        return super[key];
    }
  }
}

class ErrorCommonTranslations_en_US extends ErrorCommonTranslations {
  final CommonTranslations_en_US _parent;
  const ErrorCommonTranslations_en_US(this._parent) : super(_parent);
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
        return super[key];
    }
  }
}
