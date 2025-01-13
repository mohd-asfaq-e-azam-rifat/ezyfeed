import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  genericArgumentFactories: true,
)
class ApiResponse<T> {
  // common
  @JsonKey(defaultValue: null)
  late String? code;

  @JsonKey(defaultValue: null, name: "msg")
  late String? message;

  // data
  @JsonKey(defaultValue: null)
  late T? data;

  @JsonKey(defaultValue: null)
  late Meta? meta;

  // auth
  @JsonKey(defaultValue: null)
  late String? token;

  @JsonKey(defaultValue: null)
  late String? type;

  // custom error
  @JsonKey(defaultValue: null)
  late Error? errors;

  // server error
  @JsonKey(defaultValue: null)
  late int? status;

  @JsonKey(defaultValue: null)
  late String? timestamp;

  @JsonKey(defaultValue: null)
  late String? error;

  @JsonKey(defaultValue: null)
  late String? path;

  @JsonKey(defaultValue: null)
  late String? expiredIn;

  ApiResponse();

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,) {
    return _$ApiResponseFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,) {
    return _$ApiResponseToJson(this, toJsonT);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ErrorItem {
  @JsonKey(defaultValue: null)
  late String? message;

  @JsonKey(defaultValue: null)
  late String? pointer;

  ErrorItem();

  factory ErrorItem.fromJson(Map<String, dynamic> json) =>
      _$ErrorItemFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorItemToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Error {
  @JsonKey(defaultValue: null)
  late String? description;

  @JsonKey(defaultValue: null)
  late List<ErrorItem>? details;

  Error();

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.none)
class Meta {
  @JsonKey(defaultValue: null)
  late int? pageNo;

  @JsonKey(defaultValue: null)
  late int? pageSize;

  @JsonKey(defaultValue: null)
  late int? totalPages;

  @JsonKey(defaultValue: null)
  late int? totalElements;

  @JsonKey(defaultValue: null)
  late bool? sorted;

  @JsonKey(defaultValue: null)
  late String? sortOrder;

  @JsonKey(defaultValue: null)
  late String? sortBy;

  @JsonKey(defaultValue: null)
  late bool? hasMore;

  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
