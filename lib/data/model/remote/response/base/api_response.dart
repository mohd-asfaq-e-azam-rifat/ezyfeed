import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    // Common
    String? code,
    @JsonKey(name: "msg") String? message,

    // Data
    T? data,

    // Auth
    String? token,
    String? type,

    // Custom error
    Error? errors,

    // Server error
    int? status,
    String? timestamp,
    String? error,
    String? path,
    @JsonKey(name: "expired_in") String? expiredIn,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

@freezed
class ErrorItem with _$ErrorItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ErrorItem({
    String? message,
    String? pointer,
  }) = _ErrorItem;

  factory ErrorItem.fromJson(Map<String, Object?> json) =>
      _$ErrorItemFromJson(json);
}

@freezed
class Error with _$Error {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Error({
    String? description,
    List<ErrorItem>? details,
  }) = _Error;

  factory Error.fromJson(Map<String, Object?> json) => _$ErrorFromJson(json);
}
