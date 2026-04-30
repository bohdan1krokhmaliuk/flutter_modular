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
}

final class ExceptionPresentation extends Presentation {
  const ExceptionPresentation._(this.exception);

  final FailureException exception;
}
