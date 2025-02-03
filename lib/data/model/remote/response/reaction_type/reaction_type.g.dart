// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReactionTypeImpl _$$ReactionTypeImplFromJson(Map<String, dynamic> json) =>
    _$ReactionTypeImpl(
      feedId: (json['feed_id'] as num?)?.toInt(),
      reactionType: json['reaction_type'] as String?,
    );

Map<String, dynamic> _$$ReactionTypeImplToJson(_$ReactionTypeImpl instance) =>
    <String, dynamic>{
      'feed_id': instance.feedId,
      'reaction_type': instance.reactionType,
    };
