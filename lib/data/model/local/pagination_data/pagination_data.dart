import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_data.freezed.dart';
part 'pagination_data.g.dart';

@freezed
class PaginationData with _$PaginationData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PaginationData({
    int? lastId,
    bool? isLastPage,
  }) = _PaginationData;

  factory PaginationData.fromJson(Map<String, Object?> json) =>
      _$PaginationDataFromJson(json);
}
