// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReactionType _$ReactionTypeFromJson(Map<String, dynamic> json) => ReactionType()
  ..reactionType = json['reaction_type'] as String?
  ..feedId = (json['feed_id'] as num?)?.toInt();

Map<String, dynamic> _$ReactionTypeToJson(ReactionType instance) =>
    <String, dynamic>{
      'reaction_type': instance.reactionType,
      'feed_id': instance.feedId,
    };
