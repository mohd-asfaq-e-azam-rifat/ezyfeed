import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reaction_type.freezed.dart';
part 'reaction_type.g.dart';

@freezed
class ReactionType with _$ReactionType {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ReactionType({
    int? feedId,
    String? reactionType,
  }) = _ReactionType;

  factory ReactionType.fromJson(Map<String, Object?> json) =>
      _$ReactionTypeFromJson(json);
}