import 'package:json_annotation/json_annotation.dart';

part 'pagination_data.g.dart';

@JsonSerializable()
class PaginationData {
  const PaginationData({required this.count, required this.pages});

  factory PaginationData.fromJson(Map<String, dynamic> json) =>
      _$PaginationDataFromJson(json);

  final int count;
  final int pages;
}
