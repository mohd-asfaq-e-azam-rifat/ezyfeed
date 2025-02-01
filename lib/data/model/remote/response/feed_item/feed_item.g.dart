// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedItem _$FeedItemFromJson(Map<String, dynamic> json) => FeedItem()
  ..id = (json['id'] as num?)?.toInt()
  ..feedText = json['feed_txt'] as String?
  ..activityType = json['activity_type'] as String?
  ..fileType = $enumDecodeNullable(_$FileTypeEnumMap, json['file_type'])
  ..likeCount = (json['like_count'] as num?)?.toInt()
  ..commentCount = (json['comment_count'] as num?)?.toInt()
  ..createdAt = json['created_at'] as String?
  ..updatedAt = json['updated_at'] as String?
  ..isBackground = (json['is_background'] as num?)?.toInt()
  ..backgroundColor = json['bg_color'] as String?
  ..user = json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>)
  ..reactions = (json['likeType'] as List<dynamic>?)
      ?.map((e) => ReactionType.fromJson(e as Map<String, dynamic>))
      .toList()
  ..myReaction = json['like'] == null
      ? null
      : Like.fromJson(json['like'] as Map<String, dynamic>);

Map<String, dynamic> _$FeedItemToJson(FeedItem instance) => <String, dynamic>{
      'id': instance.id,
      'feed_txt': instance.feedText,
      'activity_type': instance.activityType,
      'file_type': _$FileTypeEnumMap[instance.fileType],
      'like_count': instance.likeCount,
      'comment_count': instance.commentCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_background': instance.isBackground,
      'bg_color': instance.backgroundColor,
      'user': instance.user,
      'likeType': instance.reactions,
      'like': instance.myReaction,
    };

const _$FileTypeEnumMap = {
  FileType.text: 'text',
  FileType.photo: 'photos',
  FileType.audio: 'audio',
  FileType.file: 'File',
};
