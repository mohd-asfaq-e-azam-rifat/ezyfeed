// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiResponse<T> _$ApiResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ApiResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiResponse<T> {
// Common
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "msg")
  String? get message => throw _privateConstructorUsedError; // Data
  T? get data => throw _privateConstructorUsedError; // Auth
  String? get token => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError; // Custom error
  Error? get errors => throw _privateConstructorUsedError; // Server error
  int? get status => throw _privateConstructorUsedError;
  String? get timestamp => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  @JsonKey(name: "expired_in")
  String? get expiredIn => throw _privateConstructorUsedError;

  /// Serializes this ApiResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: "msg") String? message,
      T? data,
      String? token,
      String? type,
      Error? errors,
      int? status,
      String? timestamp,
      String? error,
      String? path,
      @JsonKey(name: "expired_in") String? expiredIn});

  $ErrorCopyWith<$Res>? get errors;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? token = freezed,
    Object? type = freezed,
    Object? errors = freezed,
    Object? status = freezed,
    Object? timestamp = freezed,
    Object? error = freezed,
    Object? path = freezed,
    Object? expiredIn = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Error?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredIn: freezed == expiredIn
          ? _value.expiredIn
          : expiredIn // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<$Res>? get errors {
    if (_value.errors == null) {
      return null;
    }

    return $ErrorCopyWith<$Res>(_value.errors!, (value) {
      return _then(_value.copyWith(errors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ApiResponseImplCopyWith(_$ApiResponseImpl<T> value,
          $Res Function(_$ApiResponseImpl<T>) then) =
      __$$ApiResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: "msg") String? message,
      T? data,
      String? token,
      String? type,
      Error? errors,
      int? status,
      String? timestamp,
      String? error,
      String? path,
      @JsonKey(name: "expired_in") String? expiredIn});

  @override
  $ErrorCopyWith<$Res>? get errors;
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiResponseImpl<T>>
    implements _$$ApiResponseImplCopyWith<T, $Res> {
  __$$ApiResponseImplCopyWithImpl(
      _$ApiResponseImpl<T> _value, $Res Function(_$ApiResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? token = freezed,
    Object? type = freezed,
    Object? errors = freezed,
    Object? status = freezed,
    Object? timestamp = freezed,
    Object? error = freezed,
    Object? path = freezed,
    Object? expiredIn = freezed,
  }) {
    return _then(_$ApiResponseImpl<T>(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Error?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredIn: freezed == expiredIn
          ? _value.expiredIn
          : expiredIn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiResponseImpl<T>
    with DiagnosticableTreeMixin
    implements _ApiResponse<T> {
  const _$ApiResponseImpl(
      {this.code,
      @JsonKey(name: "msg") this.message,
      this.data,
      this.token,
      this.type,
      this.errors,
      this.status,
      this.timestamp,
      this.error,
      this.path,
      @JsonKey(name: "expired_in") this.expiredIn});

  factory _$ApiResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ApiResponseImplFromJson(json, fromJsonT);

// Common
  @override
  final String? code;
  @override
  @JsonKey(name: "msg")
  final String? message;
// Data
  @override
  final T? data;
// Auth
  @override
  final String? token;
  @override
  final String? type;
// Custom error
  @override
  final Error? errors;
// Server error
  @override
  final int? status;
  @override
  final String? timestamp;
  @override
  final String? error;
  @override
  final String? path;
  @override
  @JsonKey(name: "expired_in")
  final String? expiredIn;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiResponse<$T>(code: $code, message: $message, data: $data, token: $token, type: $type, errors: $errors, status: $status, timestamp: $timestamp, error: $error, path: $path, expiredIn: $expiredIn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiResponse<$T>'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('errors', errors))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('expiredIn', expiredIn));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl<T> &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.errors, errors) || other.errors == errors) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.expiredIn, expiredIn) ||
                other.expiredIn == expiredIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      message,
      const DeepCollectionEquality().hash(data),
      token,
      type,
      errors,
      status,
      timestamp,
      error,
      path,
      expiredIn);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<T, _$ApiResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _ApiResponse<T> implements ApiResponse<T> {
  const factory _ApiResponse(
          {final String? code,
          @JsonKey(name: "msg") final String? message,
          final T? data,
          final String? token,
          final String? type,
          final Error? errors,
          final int? status,
          final String? timestamp,
          final String? error,
          final String? path,
          @JsonKey(name: "expired_in") final String? expiredIn}) =
      _$ApiResponseImpl<T>;

  factory _ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ApiResponseImpl<T>.fromJson;

// Common
  @override
  String? get code;
  @override
  @JsonKey(name: "msg")
  String? get message; // Data
  @override
  T? get data; // Auth
  @override
  String? get token;
  @override
  String? get type; // Custom error
  @override
  Error? get errors; // Server error
  @override
  int? get status;
  @override
  String? get timestamp;
  @override
  String? get error;
  @override
  String? get path;
  @override
  @JsonKey(name: "expired_in")
  String? get expiredIn;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

ErrorItem _$ErrorItemFromJson(Map<String, dynamic> json) {
  return _ErrorItem.fromJson(json);
}

/// @nodoc
mixin _$ErrorItem {
  String? get message => throw _privateConstructorUsedError;
  String? get pointer => throw _privateConstructorUsedError;

  /// Serializes this ErrorItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorItemCopyWith<ErrorItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorItemCopyWith<$Res> {
  factory $ErrorItemCopyWith(ErrorItem value, $Res Function(ErrorItem) then) =
      _$ErrorItemCopyWithImpl<$Res, ErrorItem>;
  @useResult
  $Res call({String? message, String? pointer});
}

/// @nodoc
class _$ErrorItemCopyWithImpl<$Res, $Val extends ErrorItem>
    implements $ErrorItemCopyWith<$Res> {
  _$ErrorItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? pointer = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      pointer: freezed == pointer
          ? _value.pointer
          : pointer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorItemImplCopyWith<$Res>
    implements $ErrorItemCopyWith<$Res> {
  factory _$$ErrorItemImplCopyWith(
          _$ErrorItemImpl value, $Res Function(_$ErrorItemImpl) then) =
      __$$ErrorItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? pointer});
}

/// @nodoc
class __$$ErrorItemImplCopyWithImpl<$Res>
    extends _$ErrorItemCopyWithImpl<$Res, _$ErrorItemImpl>
    implements _$$ErrorItemImplCopyWith<$Res> {
  __$$ErrorItemImplCopyWithImpl(
      _$ErrorItemImpl _value, $Res Function(_$ErrorItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? pointer = freezed,
  }) {
    return _then(_$ErrorItemImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      pointer: freezed == pointer
          ? _value.pointer
          : pointer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ErrorItemImpl with DiagnosticableTreeMixin implements _ErrorItem {
  const _$ErrorItemImpl({this.message, this.pointer});

  factory _$ErrorItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorItemImplFromJson(json);

  @override
  final String? message;
  @override
  final String? pointer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorItem(message: $message, pointer: $pointer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErrorItem'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('pointer', pointer));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorItemImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.pointer, pointer) || other.pointer == pointer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, pointer);

  /// Create a copy of ErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorItemImplCopyWith<_$ErrorItemImpl> get copyWith =>
      __$$ErrorItemImplCopyWithImpl<_$ErrorItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorItemImplToJson(
      this,
    );
  }
}

abstract class _ErrorItem implements ErrorItem {
  const factory _ErrorItem({final String? message, final String? pointer}) =
      _$ErrorItemImpl;

  factory _ErrorItem.fromJson(Map<String, dynamic> json) =
      _$ErrorItemImpl.fromJson;

  @override
  String? get message;
  @override
  String? get pointer;

  /// Create a copy of ErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorItemImplCopyWith<_$ErrorItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return _Error.fromJson(json);
}

/// @nodoc
mixin _$Error {
  String? get description => throw _privateConstructorUsedError;
  List<ErrorItem>? get details => throw _privateConstructorUsedError;

  /// Serializes this Error to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res, Error>;
  @useResult
  $Res call({String? description, List<ErrorItem>? details});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res, $Val extends Error>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<ErrorItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> implements $ErrorCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? description, List<ErrorItem>? details});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ErrorCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? details = freezed,
  }) {
    return _then(_$ErrorImpl(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<ErrorItem>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl({this.description, final List<ErrorItem>? details})
      : _details = details;

  factory _$ErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorImplFromJson(json);

  @override
  final String? description;
  final List<ErrorItem>? _details;
  @override
  List<ErrorItem>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Error(description: $description, details: $details)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Error'))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('details', details));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, description, const DeepCollectionEquality().hash(_details));

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorImplToJson(
      this,
    );
  }
}

abstract class _Error implements Error {
  const factory _Error(
      {final String? description,
      final List<ErrorItem>? details}) = _$ErrorImpl;

  factory _Error.fromJson(Map<String, dynamic> json) = _$ErrorImpl.fromJson;

  @override
  String? get description;
  @override
  List<ErrorItem>? get details;

  /// Create a copy of Error
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
