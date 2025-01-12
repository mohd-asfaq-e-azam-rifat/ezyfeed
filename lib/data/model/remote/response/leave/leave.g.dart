// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Leave _$LeaveFromJson(Map<String, dynamic> json) => Leave()
  ..leaveId = (json['leaveId'] as num?)?.toInt()
  ..startFrom = (json['startFrom'] as num?)?.toInt()
  ..endAt = (json['endAt'] as num?)?.toInt()
  ..durationInDays = (json['durationInDays'] as num?)?.toInt()
  ..reason = json['reason'] as String?
  ..type = $enumDecodeNullable(_$LeaveTypeEnumMap, json['type'])
  ..status = $enumDecodeNullable(_$LeaveStatusEnumMap, json['status'])
  ..approvedBy = json['approvedBy'] as String?
  ..approverName = json['approverName'] as String?
  ..approverProfilePicture = json['approverProfilePicture'] as String?
  ..statusChangeReason = json['statusChangeReason'] as String?
  ..name = json['name'] as String?
  ..profilePicture = json['profilePicture'] as String?
  ..teams = json['teams'] as String?
  ..totalLeavesCurrentYear = (json['totalLeavesCurrentYear'] as num?)?.toInt()
  ..totalForecastedLeaveCount =
      (json['totalForecastedLeaveCount'] as num?)?.toInt();

Map<String, dynamic> _$LeaveToJson(Leave instance) => <String, dynamic>{
      'leaveId': instance.leaveId,
      'startFrom': instance.startFrom,
      'endAt': instance.endAt,
      'durationInDays': instance.durationInDays,
      'reason': instance.reason,
      'type': instance.type,
      'status': instance.status,
      'approvedBy': instance.approvedBy,
      'approverName': instance.approverName,
      'approverProfilePicture': instance.approverProfilePicture,
      'statusChangeReason': instance.statusChangeReason,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
      'teams': instance.teams,
      'totalLeavesCurrentYear': instance.totalLeavesCurrentYear,
      'totalForecastedLeaveCount': instance.totalForecastedLeaveCount,
    };

const _$LeaveTypeEnumMap = {
  LeaveType.sick: 'SICK',
  LeaveType.unpaid: 'UNPAID',
  LeaveType.casualSick: 'CASUAL_SICK',
  LeaveType.hospitalized: 'HOSPITALIZED',
  LeaveType.casual: 'CASUAL',
};

const _$LeaveStatusEnumMap = {
  LeaveStatus.pending: 'PENDING',
  LeaveStatus.approved: 'APPROVED',
  LeaveStatus.declined: 'DECLINED',
  LeaveStatus.canceled: 'CANCELED',
};

LeaveList _$LeaveListFromJson(Map<String, dynamic> json) => LeaveList()
  ..leaves = (json['leaves'] as List<dynamic>?)
      ?.map((e) => Leave.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$LeaveListToJson(LeaveList instance) => <String, dynamic>{
      'leaves': instance.leaves,
    };

LeaveSummary _$LeaveSummaryFromJson(Map<String, dynamic> json) => LeaveSummary()
  ..totalLeaves = (json['totalLeaves'] as num?)?.toInt()
  ..totalForecastedLeaves = (json['totalForecastedLeaves'] as num?)?.toInt();

Map<String, dynamic> _$LeaveSummaryToJson(LeaveSummary instance) =>
    <String, dynamic>{
      'totalLeaves': instance.totalLeaves,
      'totalForecastedLeaves': instance.totalForecastedLeaves,
    };
