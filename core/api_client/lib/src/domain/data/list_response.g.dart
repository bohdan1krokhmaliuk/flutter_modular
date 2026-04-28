// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListResponse<T> _$ListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ListResponse<T>(
  data: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
  meta: PaginationData.fromJson(json['info'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListResponseToJson<T>(
  ListResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'info': instance.meta,
  'results': instance.data.map(toJsonT).toList(),
};
