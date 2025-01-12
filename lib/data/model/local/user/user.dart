import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class User {
  @JsonKey(defaultValue: null)
  late String? employeeId;

  @JsonKey(defaultValue: null)
  late String? name;

  @JsonKey(defaultValue: null)
  late String? designation;

  @JsonKey(defaultValue: null, name: "profilePictureUrl")
  late String? profilePicture;

  @JsonKey(defaultValue: null)
  late String? email;

  @JsonKey(defaultValue: null)
  late String? gender;

  @JsonKey(defaultValue: false, name: "isSuperVisor")
  late bool? isSupervisor;

  @JsonKey(defaultValue: null)
  late String? joiningDate;

  User.create(
    this.employeeId,
    this.name,
    this.designation,
    this.profilePicture,
    this.email,
    this.gender,
    this.isSupervisor,
    this.joiningDate,
  );

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
