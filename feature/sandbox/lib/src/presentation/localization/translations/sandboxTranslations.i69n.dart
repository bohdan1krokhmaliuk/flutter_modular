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

class SandboxTranslations implements i69n.I69nMessageBundle {
  const SandboxTranslations();
  MainSandboxTranslations get main => MainSandboxTranslations(this);
  PresentationSandboxTranslations get presentation =>
      PresentationSandboxTranslations(this);
  Object operator [](String key) {
    throw Exception(
        '[] operator is disabled in en, see _i69n: nomap, notraverse flag.');
  }
}

class MainSandboxTranslations implements i69n.I69nMessageBundle {
  final SandboxTranslations _parent;
  const MainSandboxTranslations(this._parent);
  String get title => "Home";
  String get makeCall => "Make Call";
  String get customException => "Make custom failure api call";
  String get customExceptionDescription =>
      "This card onTap logic makes an api call which always fails but is processed emmitting custom exception and Presenter handlign that exception";
  String get defaultException => "Make failure api call";
  String get defaultExceptionDescription =>
      "This card onTap logic makes an api call which always fails - and it demostrates how Presenter handles default exceptions";
  String get rickAndMorty => "Check out our new rick and morty list!";
  String get rickAndMortyDescription =>
      "This characters feature demonstrates work with API, fetching paginated list of Rick and morty characters";
  String get quest => "Pass your knowledge quiz!";
  String get questDescription =>
      "This quiz feature demonstrates internal navigation (flow), and global custom presentation (confetti) if u finish it succesfully";
  String get takeALook => "Take a look";
  Object operator [](String key) {
    throw Exception(
        '[] operator is disabled in en.main, see _i69n: nomap, notraverse flag.');
  }
}

class PresentationSandboxTranslations implements i69n.I69nMessageBundle {
  final SandboxTranslations _parent;
  const PresentationSandboxTranslations(this._parent);
  String get oops => "Good luck next time!";
  String get congrats => "Good Job!";
  String get custom => "We intercepted custom exception here :)";
  Object operator [](String key) {
    throw Exception(
        '[] operator is disabled in en.presentation, see _i69n: nomap, notraverse flag.');
  }
}
