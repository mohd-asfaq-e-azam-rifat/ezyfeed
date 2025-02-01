import 'package:json_annotation/json_annotation.dart';

part 'pagination_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PaginationData {
  @JsonKey(defaultValue: null)
  late int? lastId;

  @JsonKey(defaultValue: null)
  late bool? isLastPage;

  PaginationData({
    this.lastId,
    this.isLastPage,
  });

  factory PaginationData.fromJson(Map<String, dynamic> json) {
    return _$PaginationDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PaginationDataToJson(this);
  }
}
