import 'package:ezyfeed/data/model/remote/response/like/like.dart';
import 'package:ezyfeed/data/model/remote/response/reaction_type/reaction_type.dart';
import 'package:ezyfeed/data/model/remote/response/user/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_item.freezed.dart';
part 'feed_item.g.dart';

@freezed
class FeedItem with _$FeedItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory FeedItem({
    int? id,
    @JsonKey(name: "feed_txt") String? feedText,
    String? activityType,
    FileType? fileType,
    int? likeCount,
    int? commentCount,
    String? createdAt,
    String? updatedAt,
    int? isBackground,
    @JsonKey(name: "bg_color") String? backgroundColor,
    User? user,
    @JsonKey(name: "likeType") List<ReactionType>? reactions,
    @JsonKey(name: "like") Like? myReaction,
  }) = _FeedItem;

  const FeedItem._();

  factory FeedItem.fromJson(Map<String, Object?> json) =>
      _$FeedItemFromJson(json);

  bool get hasMyReaction {
    return myReaction?.reactionType != null;
  }
}

enum FileType {
  @JsonValue("text")
  text,
  @JsonValue("photos")
  photo,
  @JsonValue("audio")
  audio,
  @JsonValue("File")
  file;
}
