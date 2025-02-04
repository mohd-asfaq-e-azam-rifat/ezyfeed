// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: (json['id'] as num?)?.toInt(),
      parentId: (json['parrent_id'] as num?)?.toInt(),
      feedId: (json['feed_id'] as num?)?.toInt(),
      text: json['comment_txt'] as String?,
      replyCount: (json['reply_count'] as num?)?.toInt(),
      likeCount: (json['like_count'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parrent_id': instance.parentId,
      'feed_id': instance.feedId,
      'comment_txt': instance.text,
      'reply_count': instance.replyCount,
      'like_count': instance.likeCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user': instance.user?.toJson(),
    };
