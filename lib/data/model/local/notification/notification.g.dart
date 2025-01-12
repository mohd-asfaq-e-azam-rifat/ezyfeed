// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    AppNotification()
      ..id = json['id'] as String?
      ..title = json['title'] as String?
      ..body = json['body'] as String?
      ..arrivalTime = json['arrival_time'] == null
          ? null
          : DateTime.parse(json['arrival_time'] as String)
      ..isOpened = json['is_opened'] as bool? ?? false
      ..belongsTo = json['belongs_to'] as String?
      ..payload = json['payload'] as String?
      ..action = json['action'] as String?;

Map<String, dynamic> _$AppNotificationToJson(AppNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'arrival_time': instance.arrivalTime?.toIso8601String(),
      'is_opened': instance.isOpened,
      'belongs_to': instance.belongsTo,
      'payload': instance.payload,
      'action': instance.action,
    };
