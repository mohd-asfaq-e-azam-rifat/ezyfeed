import 'package:json_annotation/json_annotation.dart';

part 'leave.g.dart';

enum LeaveType {
  // Deprecated and removed from frontend
  @JsonValue("SICK")
  sick(title: "Sick"),
  @JsonValue("UNPAID")
  unpaid(title: "Unpaid"),

  // Available
  @JsonValue("CASUAL_SICK")
  casualSick(
    title: "Casual Sick",
    subtitle: "Leave for employee/relative sick circumstances.",
  ),
  @JsonValue("HOSPITALIZED")
  hospitalized(
    title: "Hospitalized",
    subtitle: "Leave due to employee/relative hospitalization.",
  ),
  @JsonValue("CASUAL")
  casual(
    title: "Casual",
    subtitle: "General casual leave.",
  );

  const LeaveType({
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  String? toJson() => _$LeaveTypeEnumMap[this];
}

List<LeaveType> get leaveTypes {
  return const [
    LeaveType.casualSick,
    LeaveType.hospitalized,
    LeaveType.casual,
  ];
}

enum LeaveStatus {
  @JsonValue("PENDING")
  pending("Pending"),
  @JsonValue("APPROVED")
  approved("Approved"),
  @JsonValue("DECLINED")
  declined("Rejected"),
  @JsonValue("CANCELED")
  canceled("Canceled");

  const LeaveStatus(this.value);

  String? toJson() => _$LeaveStatusEnumMap[this];

  final String value;
}

@JsonSerializable(fieldRename: FieldRename.none)
class Leave {
  @JsonKey(defaultValue: null)
  late int? leaveId;

  @JsonKey(defaultValue: null)
  late int? startFrom;

  @JsonKey(defaultValue: null)
  late int? endAt;

  @JsonKey(defaultValue: null)
  late int? durationInDays;

  @JsonKey(defaultValue: null)
  late String? reason;

  @JsonKey(defaultValue: null)
  late LeaveType? type;

  @JsonKey(defaultValue: null)
  late LeaveStatus? status;

  @JsonKey(defaultValue: null)
  late String? approvedBy;

  @JsonKey(defaultValue: null)
  late String? approverName;

  @JsonKey(defaultValue: null)
  late String? approverProfilePicture;

  @JsonKey(defaultValue: null)
  late String? statusChangeReason;

  @JsonKey(defaultValue: null)
  late String? name;

  @JsonKey(defaultValue: null)
  late String? profilePicture;

  @JsonKey(defaultValue: null)
  late String? teams;

  @JsonKey(defaultValue: null)
  late int? totalLeavesCurrentYear;

  @JsonKey(defaultValue: null)
  late int? totalForecastedLeaveCount;

  Leave();

  factory Leave.fromJson(Map<String, dynamic> json) => _$LeaveFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.none)
class LeaveList {
  @JsonKey(defaultValue: null)
  late List<Leave>? leaves;

  LeaveList();

  factory LeaveList.fromJson(Map<String, dynamic> json) {
    return _$LeaveListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeaveListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.none)
class LeaveSummary {
  @JsonKey(defaultValue: null)
  late int? totalLeaves;

  @JsonKey(defaultValue: null)
  late int? totalForecastedLeaves;

  LeaveSummary();

  factory LeaveSummary.fromJson(Map<String, dynamic> json) {
    return _$LeaveSummaryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeaveSummaryToJson(this);
}
