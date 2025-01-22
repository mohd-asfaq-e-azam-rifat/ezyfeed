import 'package:ezyfeed/data/model/remote/response/base/common_response.dart';
import 'package:ezyfeed/data/model/remote/response/like/like.dart';
import 'package:ezyfeed/data/model/remote/response/reaction_type/reaction_type.dart';
import 'package:ezyfeed/data/model/remote/response/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FeedItem {
  @JsonKey(defaultValue: null)
  late int? id;

  @JsonKey(defaultValue: null)
  late int? schoolId;

  @JsonKey(defaultValue: null)
  late int? userId;

  @JsonKey(defaultValue: null)
  late int? courseId;

  @JsonKey(defaultValue: null)
  late int? communityId;

  @JsonKey(defaultValue: null)
  late int? groupId;

  @JsonKey(defaultValue: null, name: "feed_txt")
  late String? feedText;

  @JsonKey(defaultValue: null)
  late String? status;

  @JsonKey(defaultValue: null)
  late String? slug;

  @JsonKey(defaultValue: null)
  late String? title;

  @JsonKey(defaultValue: null)
  late String? activityType;

  @JsonKey(defaultValue: null)
  late int? isPinned;

  @JsonKey(defaultValue: null)
  late String? fileType;

  @JsonKey(defaultValue: null)
  late List<String>? files;

  @JsonKey(defaultValue: null)
  late int? likeCount;

  @JsonKey(defaultValue: null)
  late int? commentCount;

  @JsonKey(defaultValue: null)
  late int? shareCount;

  @JsonKey(defaultValue: null)
  late int? shareId;

  @JsonKey(defaultValue: null)
  late String? createdAt;

  @JsonKey(defaultValue: null)
  late String? updatedAt;

  @JsonKey(defaultValue: null)
  late String? feedPrivacy;

  @JsonKey(defaultValue: null)
  late int? isBackground;

  @JsonKey(defaultValue: null, name: "bg_color")
  late String? backgroundColor;

  @JsonKey(defaultValue: null)
  late int? pollId;

  @JsonKey(defaultValue: null)
  late int? lessonId;

  @JsonKey(defaultValue: null)
  late int? spaceId;

  @JsonKey(defaultValue: null)
  late int? videoId;

  @JsonKey(defaultValue: null)
  late int? streamId;

  @JsonKey(defaultValue: null)
  late int? blogId;

  @JsonKey(defaultValue: null)
  late String? scheduleDate;

  @JsonKey(defaultValue: null)
  late String? timezone;

  @JsonKey(defaultValue: null)
  late bool? isAnonymous;

  @JsonKey(defaultValue: null)
  late int? meetingId;

  @JsonKey(defaultValue: null)
  late int? sellerId;

  @JsonKey(defaultValue: null)
  late String? publishDate;

  @JsonKey(defaultValue: null)
  late bool? isFeedEdit;

  @JsonKey(defaultValue: null)
  late String? name;

  @JsonKey(defaultValue: null, name: "pic")
  late String? photo;

  @JsonKey(defaultValue: null)
  late int? uid;

  @JsonKey(defaultValue: null)
  late int? isPrivateChat;

  @JsonKey(defaultValue: null)
  late User? user;

  @JsonKey(defaultValue: null)
  late String? poll;

  @JsonKey(defaultValue: null, name: "likeType")
  late List<ReactionType>? reactionType;

  @JsonKey(defaultValue: null)
  late Like? like;

  @JsonKey(defaultValue: null)
  late Meta? meta;

  FeedItem();

  factory FeedItem.fromJson(Map<String, dynamic> json) =>
      _$FeedItemFromJson(json);

  Map<String, dynamic> toJson() => _$FeedItemToJson(this);
}
