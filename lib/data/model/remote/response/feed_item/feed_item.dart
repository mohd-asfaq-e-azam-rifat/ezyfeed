import 'package:ezyfeed/data/model/remote/response/like/like.dart';
import 'package:ezyfeed/data/model/remote/response/reaction_type/reaction_type.dart';
import 'package:ezyfeed/data/model/remote/response/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FeedItem {
  @JsonKey(defaultValue: null)
  late int? id;

  @JsonKey(defaultValue: null, name: "feed_txt")
  late String? feedText;

  @JsonKey(defaultValue: null)
  late String? activityType;

  @JsonKey(defaultValue: null)
  late FileType? fileType;

  @JsonKey(defaultValue: null)
  late int? likeCount;

  @JsonKey(defaultValue: null)
  late int? commentCount;

  @JsonKey(defaultValue: null)
  late String? createdAt;

  @JsonKey(defaultValue: null)
  late String? updatedAt;

  @JsonKey(defaultValue: null)
  late int? isBackground;

  @JsonKey(defaultValue: null, name: "bg_color")
  late String? backgroundColor;

  @JsonKey(defaultValue: null)
  late User? user;

  @JsonKey(defaultValue: null, name: "likeType")
  late List<ReactionType>? reactions;

  @JsonKey(defaultValue: null, name: "like")
  late Like? myReaction;

  FeedItem();

  factory FeedItem.fromJson(Map<String, dynamic> json) =>
      _$FeedItemFromJson(json);

  Map<String, dynamic> toJson() => _$FeedItemToJson(this);

  bool get hasMyReaction {
    return myReaction != null;
  }
}

enum FileType {
  @JsonValue("text")
  text,
  @JsonValue("File")
  file;
}
