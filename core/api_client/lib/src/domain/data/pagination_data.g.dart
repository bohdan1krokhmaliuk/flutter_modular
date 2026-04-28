// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationData _$PaginationDataFromJson(Map<String, dynamic> json) =>
    PaginationData(
      count: (json['count'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationDataToJson(PaginationData instance) =>
    <String, dynamic>{'count': instance.count, 'pages': instance.pages};
