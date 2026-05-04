import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prelude/prelude.dart';

const presentingModel = Freezed(
  equal: false,
  toJson: false,
  fromJson: false,
  copyWith: false,
);

interface class Presentation {
  const Presentation();

  factory Presentation.error(FailureException exception) =
      ExceptionPresentation._;

  factory Presentation.confetti({
    Duration duration = const Duration(seconds: 5),
  }) => ConfettiPresentation._(duration: duration);
}

final class ExceptionPresentation extends Presentation {
  const ExceptionPresentation._(this.exception);

  final FailureException exception;
}

final class ConfettiPresentation extends Presentation {
  const ConfettiPresentation._({this.duration = const Duration(seconds: 5)});

  final Duration duration;
}
