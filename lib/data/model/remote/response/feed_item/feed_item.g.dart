// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedItem _$FeedItemFromJson(Map<String, dynamic> json) => FeedItem()
  ..id = (json['id'] as num?)?.toInt()
  ..schoolId = (json['school_id'] as num?)?.toInt()
  ..userId = (json['user_id'] as num?)?.toInt()
  ..courseId = (json['course_id'] as num?)?.toInt()
  ..communityId = (json['community_id'] as num?)?.toInt()
  ..groupId = (json['group_id'] as num?)?.toInt()
  ..feedText = json['feed_txt'] as String?
  ..status = json['status'] as String?
  ..slug = json['slug'] as String?
  ..title = json['title'] as String?
  ..activityType = json['activity_type'] as String?
  ..isPinned = (json['is_pinned'] as num?)?.toInt()
  ..fileType = json['file_type'] as String?
  ..files = (json['files'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..likeCount = (json['like_count'] as num?)?.toInt()
  ..commentCount = (json['comment_count'] as num?)?.toInt()
  ..shareCount = (json['share_count'] as num?)?.toInt()
  ..shareId = (json['share_id'] as num?)?.toInt()
  ..createdAt = json['created_at'] as String?
  ..updatedAt = json['updated_at'] as String?
  ..feedPrivacy = json['feed_privacy'] as String?
  ..isBackground = (json['is_background'] as num?)?.toInt()
  ..backgroundColor = json['bg_color'] as String?
  ..pollId = (json['poll_id'] as num?)?.toInt()
  ..lessonId = (json['lesson_id'] as num?)?.toInt()
  ..spaceId = (json['space_id'] as num?)?.toInt()
  ..videoId = (json['video_id'] as num?)?.toInt()
  ..streamId = (json['stream_id'] as num?)?.toInt()
  ..blogId = (json['blog_id'] as num?)?.toInt()
  ..scheduleDate = json['schedule_date'] as String?
  ..timezone = json['timezone'] as String?
  ..isAnonymous = json['is_anonymous'] as bool?
  ..meetingId = (json['meeting_id'] as num?)?.toInt()
  ..sellerId = (json['seller_id'] as num?)?.toInt()
  ..publishDate = json['publish_date'] as String?
  ..isFeedEdit = json['is_feed_edit'] as bool?
  ..name = json['name'] as String?
  ..photo = json['pic'] as String?
  ..uid = (json['uid'] as num?)?.toInt()
  ..isPrivateChat = (json['is_private_chat'] as num?)?.toInt()
  ..user = json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>)
  ..poll = json['poll'] as String?
  ..reactionType = (json['likeType'] as List<dynamic>?)
      ?.map((e) => ReactionType.fromJson(e as Map<String, dynamic>))
      .toList()
  ..like = json['like'] == null
      ? null
      : Like.fromJson(json['like'] as Map<String, dynamic>)
  ..meta = json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$FeedItemToJson(FeedItem instance) => <String, dynamic>{
      'id': instance.id,
      'school_id': instance.schoolId,
      'user_id': instance.userId,
      'course_id': instance.courseId,
      'community_id': instance.communityId,
      'group_id': instance.groupId,
      'feed_txt': instance.feedText,
      'status': instance.status,
      'slug': instance.slug,
      'title': instance.title,
      'activity_type': instance.activityType,
      'is_pinned': instance.isPinned,
      'file_type': instance.fileType,
      'files': instance.files,
      'like_count': instance.likeCount,
      'comment_count': instance.commentCount,
      'share_count': instance.shareCount,
      'share_id': instance.shareId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'feed_privacy': instance.feedPrivacy,
      'is_background': instance.isBackground,
      'bg_color': instance.backgroundColor,
      'poll_id': instance.pollId,
      'lesson_id': instance.lessonId,
      'space_id': instance.spaceId,
      'video_id': instance.videoId,
      'stream_id': instance.streamId,
      'blog_id': instance.blogId,
      'schedule_date': instance.scheduleDate,
      'timezone': instance.timezone,
      'is_anonymous': instance.isAnonymous,
      'meeting_id': instance.meetingId,
      'seller_id': instance.sellerId,
      'publish_date': instance.publishDate,
      'is_feed_edit': instance.isFeedEdit,
      'name': instance.name,
      'pic': instance.photo,
      'uid': instance.uid,
      'is_private_chat': instance.isPrivateChat,
      'user': instance.user,
      'poll': instance.poll,
      'likeType': instance.reactionType,
      'like': instance.like,
      'meta': instance.meta,
    };
