import 'package:ezyfeed/data/model/remote/response/base/common_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  @JsonKey(defaultValue: null)
  late int? id;

  @JsonKey(defaultValue: null)
  late String? fullName;

  @JsonKey(defaultValue: null)
  late String? profilePic;

  @JsonKey(defaultValue: null)
  late int? isPrivateChat;

  @JsonKey(defaultValue: null)
  late String? expireDate;

  @JsonKey(defaultValue: null)
  late String? status;

  @JsonKey(defaultValue: null)
  late String? pauseDate;

  @JsonKey(defaultValue: null)
  late String? userType;

  @JsonKey(defaultValue: null)
  late Meta? meta;

  User();

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
