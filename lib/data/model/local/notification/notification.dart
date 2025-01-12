import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AppNotification {
  @JsonKey(defaultValue: null)
  late String? id;

  @JsonKey(defaultValue: null)
  late String? title;

  @JsonKey(defaultValue: null)
  late String? body;

  @JsonKey(defaultValue: null)
  late DateTime? arrivalTime;

  @JsonKey(defaultValue: false)
  late bool? isOpened;

  @JsonKey(defaultValue: null)
  late String? belongsTo;

  @JsonKey(defaultValue: null)
  late String? payload;

  @JsonKey(defaultValue: null)
  late String? action;

  AppNotification.create({
    this.id,
    this.title,
    this.body,
    this.arrivalTime,
    this.isOpened,
    this.belongsTo,
    this.payload,
    this.action,
  });

  AppNotification();

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return _$AppNotificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AppNotificationToJson(this);
}
