// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReactionType _$ReactionTypeFromJson(Map<String, dynamic> json) => ReactionType()
  ..reactionType = $enumDecodeNullable(_$ReactionEnumMap, json['reaction_type'])
  ..feedId = (json['feed_id'] as num?)?.toInt();

Map<String, dynamic> _$ReactionTypeToJson(ReactionType instance) =>
    <String, dynamic>{
      'reaction_type': _$ReactionEnumMap[instance.reactionType],
      'feed_id': instance.feedId,
    };

const _$ReactionEnumMap = {
  Reaction.like: 'LIKE',
  Reaction.love: 'LOVE',
  Reaction.care: 'CARE',
  Reaction.wow: 'WOW',
  Reaction.sad: 'SAD',
  Reaction.angry: 'ANGRY',
};
