import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory User({
    int? id,
    String? fullName,
    @JsonKey(name: 'profile_pic') String? profilePicture,
    String? userType,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
