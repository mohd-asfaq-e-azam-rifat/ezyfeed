import 'package:ezyfeed/data/model/remote/response/reaction_type/reaction_type.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reaction_collection.freezed.dart';
part 'reaction_collection.g.dart';

@freezed
class ReactionCollection with _$ReactionCollection {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ReactionCollection({
    int? totalReactions,
    @JsonKey(name: "likeType") List<ReactionType>? reactions,
  }) = _ReactionCollection;

  factory ReactionCollection.fromJson(Map<String, Object?> json) =>
      _$ReactionCollectionFromJson(json);
}