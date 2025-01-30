import 'package:json_annotation/json_annotation.dart';

part 'reaction_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReactionType {
  @JsonKey(defaultValue: null)
  late Reaction? reactionType;

  @JsonKey(defaultValue: null)
  late int? feedId;

  ReactionType();

  factory ReactionType.fromJson(Map<String, dynamic> json) =>
      _$ReactionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ReactionTypeToJson(this);
}

enum Reaction {
  @JsonValue("LIKE")
  like,
  @JsonValue("LOVE")
  love,
  @JsonValue("CARE")
  care,
  @JsonValue("WOW")
  wow,
  @JsonValue("SAD")
  sad,
  @JsonValue("ANGRY")
  angry;
}
