// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReactionCollectionImpl _$$ReactionCollectionImplFromJson(
        Map<String, dynamic> json) =>
    _$ReactionCollectionImpl(
      totalReactions: (json['total_reactions'] as num?)?.toInt(),
      reactions: (json['likeType'] as List<dynamic>?)
          ?.map((e) => ReactionType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReactionCollectionImplToJson(
        _$ReactionCollectionImpl instance) =>
    <String, dynamic>{
      'total_reactions': instance.totalReactions,
      'likeType': instance.reactions?.map((e) => e.toJson()).toList(),
    };
