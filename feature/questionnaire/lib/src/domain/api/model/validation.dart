import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation.freezed.dart';
part 'validation.g.dart';

@freezed
abstract class Validation with _$Validation {
  const factory Validation({required bool isCorrect}) = _Validation;

  factory Validation.fromJson(Map<String, dynamic> json) =>
      _$ValidationFromJson(json);
}
