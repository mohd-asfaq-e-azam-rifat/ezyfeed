// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..employeeId = json['employeeId'] as String?
  ..name = json['name'] as String?
  ..designation = json['designation'] as String?
  ..profilePicture = json['profilePictureUrl'] as String?
  ..email = json['email'] as String?
  ..gender = json['gender'] as String?
  ..isSupervisor = json['isSuperVisor'] as bool? ?? false
  ..joiningDate = json['joiningDate'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'employeeId': instance.employeeId,
      'name': instance.name,
      'designation': instance.designation,
      'profilePictureUrl': instance.profilePicture,
      'email': instance.email,
      'gender': instance.gender,
      'isSuperVisor': instance.isSupervisor,
      'joiningDate': instance.joiningDate,
    };
