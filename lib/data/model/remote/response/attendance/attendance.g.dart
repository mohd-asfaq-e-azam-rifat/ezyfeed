// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceLinearResponse _$AttendanceLinearResponseFromJson(
        Map<String, dynamic> json) =>
    AttendanceLinearResponse()
      ..code = (json['code'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..time = json['time'] as String?
      ..date = json['date'] as String?
      ..status = json['status'] as String?
      ..onLeave = json['onLeave'] as bool?
      ..clockOutReason = json['clockOutReason'] as String?;

Map<String, dynamic> _$AttendanceLinearResponseToJson(
        AttendanceLinearResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'time': instance.time,
      'date': instance.date,
      'status': instance.status,
      'onLeave': instance.onLeave,
      'clockOutReason': instance.clockOutReason,
    };
