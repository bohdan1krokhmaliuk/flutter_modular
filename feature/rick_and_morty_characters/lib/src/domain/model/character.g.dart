// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Character _$CharacterFromJson(Map<String, dynamic> json) => _Character(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  status:
      $enumDecodeNullable(
        _$StatusEnumMap,
        json['status'],
        unknownValue: Status.unknown,
      ) ??
      Status.unknown,
  species: json['species'] as String,
  gender:
      $enumDecodeNullable(
        _$GenderEnumMap,
        json['gender'],
        unknownValue: Gender.unknown,
      ) ??
      Gender.unknown,
  image: json['image'] as String,
  origin: ShortLocation.fromJson(json['origin'] as Map<String, dynamic>),
  location: ShortLocation.fromJson(json['location'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CharacterToJson(_Character instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$StatusEnumMap[instance.status]!,
      'species': instance.species,
      'gender': _$GenderEnumMap[instance.gender]!,
      'image': instance.image,
      'origin': instance.origin.toJson(),
      'location': instance.location.toJson(),
    };

const _$StatusEnumMap = {
  Status.alive: 'Alive',
  Status.dead: 'Dead',
  Status.unknown: 'unknown',
};

const _$GenderEnumMap = {
  Gender.male: 'Male',
  Gender.female: 'Female',
  Gender.genderless: 'Genderless',
  Gender.unknown: 'unknown',
};

_ShortLocation _$ShortLocationFromJson(Map<String, dynamic> json) =>
    _ShortLocation(
      name: json['name'] as String,
      id: _$JsonConverterFromJson<String, int?>(
        json['url'],
        const UriToIdConverter().fromJson,
      ),
    );

Map<String, dynamic> _$ShortLocationToJson(_ShortLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': ?const UriToIdConverter().toJson(instance.id),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);
