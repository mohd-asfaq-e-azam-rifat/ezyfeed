import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.freezed.dart';
part 'like.g.dart';

@freezed
class Like with _$Like {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Like({
    int? id,
    int? feedId,
    int? userId,
    String? reactionType,
    String? createdAt,
    String? updatedAt,
  }) = _Like;

  factory Like.fromJson(Map<String, Object?> json) => _$LikeFromJson(json);
}
