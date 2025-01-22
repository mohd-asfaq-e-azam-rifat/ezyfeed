// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Like _$LikeFromJson(Map<String, dynamic> json) => Like()
  ..id = (json['id'] as num?)?.toInt()
  ..feedId = (json['feed_id'] as num?)?.toInt()
  ..userId = (json['user_id'] as num?)?.toInt()
  ..reactionType = json['reaction_type'] as String?
  ..createdAt = json['created_at'] as String?
  ..updatedAt = json['updated_at'] as String?
  ..isAnonymous = (json['is_anonymous'] as num?)?.toInt()
  ..meta = json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$LikeToJson(Like instance) => <String, dynamic>{
      'id': instance.id,
      'feed_id': instance.feedId,
      'user_id': instance.userId,
      'reaction_type': instance.reactionType,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_anonymous': instance.isAnonymous,
      'meta': instance.meta,
    };
