import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/helper/date_time/date.dart';
import 'package:json_annotation/json_annotation.dart';

part 'date_range.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class DateRange {
  @JsonKey(defaultValue: null)
  late int id;

  @JsonKey(defaultValue: null)
  late String? title;

  @JsonKey(defaultValue: null)
  late DateTime? startDate;

  @JsonKey(defaultValue: null)
  late DateTime? endDate;

  @JsonKey(defaultValue: null)
  late String? rangeDisplayText;

  DateRange.create({
    required this.id,
    this.title,
    this.startDate,
    this.endDate,
    this.rangeDisplayText,
  }) {
    if (rangeDisplayText == null || rangeDisplayText?.trim().isEmpty == true) {
      final prefix = startDate?.toDayShortMonthYearFormat();
      final postfix = endDate?.toDayShortMonthYearFormat();
      rangeDisplayText = "$prefix - $postfix";
    }
  }

  DateRange();

  factory DateRange.fromJson(Map<String, dynamic> json) =>
      _$DateRangeFromJson(json);

  Map<String, dynamic> toJson() => _$DateRangeToJson(this);
}

List<DateRange> getLeaveDateRangeList() {
  return [
    DateRange.create(
      id: 100,
      title: "Last 30 days",
      startDate: getPastDate(days: 30),
      endDate: getCurrentDate(),
    ),
    DateRange.create(
      id: 101,
      title: "Last 90 days",
      startDate: getPastDate(days: 90),
      endDate: getCurrentDate(),
    ),
    DateRange.create(
      id: 102,
      title: "All Time",
      rangeDisplayText: "All Time",
    ),
  ];
}
