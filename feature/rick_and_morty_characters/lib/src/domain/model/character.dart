import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
abstract class Character with _$Character {
  const factory Character({
    required int id,
    required String name,
    @JsonKey(defaultValue: Status.unknown, unknownEnumValue: Status.unknown)
    required Status status,
    required String species,
    @JsonKey(defaultValue: Gender.unknown, unknownEnumValue: Gender.unknown)
    required Gender gender,
    required String image,
    required ShortLocation origin,
    required ShortLocation location,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

@freezed
abstract class ShortLocation with _$ShortLocation {
  const factory ShortLocation({
    required String name,
    @UriToIdConverter() @JsonKey(name: 'url') int? id,
  }) = _ShortLocation;

  factory ShortLocation.fromJson(Map<String, dynamic> json) =>
      _$ShortLocationFromJson(json);
}

enum Status {
  @JsonValue('Alive')
  alive,
  @JsonValue('Dead')
  dead,
  @JsonValue('unknown')
  unknown,
}

enum Gender {
  @JsonValue('Male')
  male,
  @JsonValue('Female')
  female,
  @JsonValue('Genderless')
  genderless,
  @JsonValue('unknown')
  unknown,
}

class UriToIdConverter extends JsonConverter<int?, String> {
  const UriToIdConverter();

  @override
  int? fromJson(String json) {
    try {
      return int.parse(Uri.parse(json).pathSegments.last);
    } catch (e) {
      return null;
    }
  }

  @override
  String toJson(int? object) => '';
}
