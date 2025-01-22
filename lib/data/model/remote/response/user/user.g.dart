// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..id = (json['id'] as num?)?.toInt()
  ..fullName = json['full_name'] as String?
  ..profilePic = json['profile_pic'] as String?
  ..isPrivateChat = (json['is_private_chat'] as num?)?.toInt()
  ..expireDate = json['expire_date'] as String?
  ..status = json['status'] as String?
  ..pauseDate = json['pause_date'] as String?
  ..userType = json['user_type'] as String?
  ..meta = json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'profile_pic': instance.profilePic,
      'is_private_chat': instance.isPrivateChat,
      'expire_date': instance.expireDate,
      'status': instance.status,
      'pause_date': instance.pauseDate,
      'user_type': instance.userType,
      'meta': instance.meta,
    };
