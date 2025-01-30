import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  @JsonKey(defaultValue: null)
  late int? id;

  @JsonKey(defaultValue: null)
  late String? fullName;

  @JsonKey(defaultValue: null, name: "profile_pic")
  late String? profilePicture;

  @JsonKey(defaultValue: null)
  late String? expireDate;

  @JsonKey(defaultValue: null)
  late String? pauseDate;

  @JsonKey(defaultValue: null)
  late String? userType;

  User();

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
