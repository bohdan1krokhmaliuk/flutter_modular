import 'package:api_client/src/domain/data/pagination_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListResponse<T> {
  const ListResponse({required this.data, required this.meta});

  factory ListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ListResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ListResponseToJson(this, toJsonT);

  @JsonKey(name: 'info')
  final PaginationData? meta;
  @JsonKey(name: 'results')
  final List<T> data;
}
