import 'package:ezyfeed/data/model/remote/response/user/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Comment({
    int? id,
    @JsonKey(name: "parrent_id") int? parentId,
    int? feedId,
    @JsonKey(name: "comment_txt") String? text,
    int? replyCount,
    int? likeCount,
    String? createdAt,
    String? updatedAt,
    User? user,
  }) = _Comment;

  const Comment._();

  factory Comment.fromJson(Map<String, Object?> json) =>
      _$CommentFromJson(json);

  bool get isReply => parentId != null;

  bool get hasReplies => replyCount != null && replyCount! > 0;
}
