import 'package:ezyfeed/data/model/remote/response/base/common_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reaction_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReactionType {

  @JsonKey(defaultValue: null)
  late String? reactionType;

  @JsonKey(defaultValue: null)
  late int? feedId;

  @JsonKey(defaultValue: null)
  late Meta? meta;

  ReactionType();

  factory ReactionType.fromJson(Map<String, dynamic> json) =>
      _$ReactionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ReactionTypeToJson(this);
}
