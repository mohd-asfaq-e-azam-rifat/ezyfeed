// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..id = (json['id'] as num?)?.toInt()
  ..fullName = json['full_name'] as String?
  ..profilePicture = json['profile_pic'] as String?
  ..expireDate = json['expire_date'] as String?
  ..pauseDate = json['pause_date'] as String?
  ..userType = json['user_type'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'profile_pic': instance.profilePicture,
      'expire_date': instance.expireDate,
      'pause_date': instance.pauseDate,
      'user_type': instance.userType,
    };
