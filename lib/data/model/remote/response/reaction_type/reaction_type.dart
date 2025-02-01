import 'package:json_annotation/json_annotation.dart';

part 'reaction_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReactionType {
  @JsonKey(defaultValue: null)
  late String? reactionType;

  @JsonKey(defaultValue: null)
  late int? feedId;

  ReactionType();

  factory ReactionType.fromJson(Map<String, dynamic> json) =>
      _$ReactionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ReactionTypeToJson(this);
}