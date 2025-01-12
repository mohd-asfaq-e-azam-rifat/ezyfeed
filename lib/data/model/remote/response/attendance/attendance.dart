import 'package:json_annotation/json_annotation.dart';

part 'attendance.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class AttendanceLinearResponse {
  @JsonKey(defaultValue: null)
  late int? code;

  @JsonKey(defaultValue: null)
  late String? message;

  @JsonKey(defaultValue: null)
  late String? time;

  @JsonKey(defaultValue: null)
  late String? date;

  @JsonKey(defaultValue: null)
  late String? status;

  @JsonKey(defaultValue: null)
  late bool? onLeave;

  @JsonKey(defaultValue: null)
  late String? clockOutReason;

  AttendanceLinearResponse();

  factory AttendanceLinearResponse.fromJson(Map<String, dynamic> json) {
    return _$AttendanceLinearResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttendanceLinearResponseToJson(this);
}
