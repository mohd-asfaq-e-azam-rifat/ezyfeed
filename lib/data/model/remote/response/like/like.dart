import 'package:ezyfeed/data/model/remote/response/base/common_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'like.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Like {
  @JsonKey(defaultValue: null)
  late int? id;

  @JsonKey(defaultValue: null)
  late int? feedId;

  @JsonKey(defaultValue: null)
  late int? userId;

  @JsonKey(defaultValue: null)
  late String? reactionType;

  @JsonKey(defaultValue: null)
  late String? createdAt;

  @JsonKey(defaultValue: null)
  late String? updatedAt;

  @JsonKey(defaultValue: null)
  late int? isAnonymous;

  @JsonKey(defaultValue: null)
  late Meta? meta;

  Like();

  factory Like.fromJson(Map<String, dynamic> json) =>
      _$LikeFromJson(json);

  Map<String, dynamic> toJson() => _$LikeToJson(this);
}
