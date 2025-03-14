// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl<T> _$$ApiResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiResponseImpl<T>(
      code: json['code'] as String?,
      message: json['msg'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      token: json['token'] as String?,
      type: json['type'] as String?,
      errors: json['errors'] == null
          ? null
          : Error.fromJson(json['errors'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      timestamp: json['timestamp'] as String?,
      error: json['error'] as String?,
      path: json['path'] as String?,
      expiredIn: json['expired_in'] as String?,
    );

Map<String, dynamic> _$$ApiResponseImplToJson<T>(
  _$ApiResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'token': instance.token,
      'type': instance.type,
      'errors': instance.errors,
      'status': instance.status,
      'timestamp': instance.timestamp,
      'error': instance.error,
      'path': instance.path,
      'expired_in': instance.expiredIn,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

_$ErrorItemImpl _$$ErrorItemImplFromJson(Map<String, dynamic> json) =>
    _$ErrorItemImpl(
      message: json['message'] as String?,
      pointer: json['pointer'] as String?,
    );

Map<String, dynamic> _$$ErrorItemImplToJson(_$ErrorItemImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'pointer': instance.pointer,
    };

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) => _$ErrorImpl(
      description: json['description'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => ErrorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'details': instance.details?.map((e) => e.toJson()).toList(),
    };
