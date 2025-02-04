// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reaction_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReactionType _$ReactionTypeFromJson(Map<String, dynamic> json) {
  return _ReactionType.fromJson(json);
}

/// @nodoc
mixin _$ReactionType {
  int? get feedId => throw _privateConstructorUsedError;
  String? get reactionType => throw _privateConstructorUsedError;

  /// Serializes this ReactionType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReactionType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReactionTypeCopyWith<ReactionType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactionTypeCopyWith<$Res> {
  factory $ReactionTypeCopyWith(
          ReactionType value, $Res Function(ReactionType) then) =
      _$ReactionTypeCopyWithImpl<$Res, ReactionType>;
  @useResult
  $Res call({int? feedId, String? reactionType});
}

/// @nodoc
class _$ReactionTypeCopyWithImpl<$Res, $Val extends ReactionType>
    implements $ReactionTypeCopyWith<$Res> {
  _$ReactionTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReactionType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedId = freezed,
    Object? reactionType = freezed,
  }) {
    return _then(_value.copyWith(
      feedId: freezed == feedId
          ? _value.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as int?,
      reactionType: freezed == reactionType
          ? _value.reactionType
          : reactionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReactionTypeImplCopyWith<$Res>
    implements $ReactionTypeCopyWith<$Res> {
  factory _$$ReactionTypeImplCopyWith(
          _$ReactionTypeImpl value, $Res Function(_$ReactionTypeImpl) then) =
      __$$ReactionTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? feedId, String? reactionType});
}

/// @nodoc
class __$$ReactionTypeImplCopyWithImpl<$Res>
    extends _$ReactionTypeCopyWithImpl<$Res, _$ReactionTypeImpl>
    implements _$$ReactionTypeImplCopyWith<$Res> {
  __$$ReactionTypeImplCopyWithImpl(
      _$ReactionTypeImpl _value, $Res Function(_$ReactionTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReactionType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedId = freezed,
    Object? reactionType = freezed,
  }) {
    return _then(_$ReactionTypeImpl(
      feedId: freezed == feedId
          ? _value.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as int?,
      reactionType: freezed == reactionType
          ? _value.reactionType
          : reactionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ReactionTypeImpl with DiagnosticableTreeMixin implements _ReactionType {
  const _$ReactionTypeImpl({this.feedId, this.reactionType});

  factory _$ReactionTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReactionTypeImplFromJson(json);

  @override
  final int? feedId;
  @override
  final String? reactionType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReactionType(feedId: $feedId, reactionType: $reactionType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReactionType'))
      ..add(DiagnosticsProperty('feedId', feedId))
      ..add(DiagnosticsProperty('reactionType', reactionType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReactionTypeImpl &&
            (identical(other.feedId, feedId) || other.feedId == feedId) &&
            (identical(other.reactionType, reactionType) ||
                other.reactionType == reactionType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, feedId, reactionType);

  /// Create a copy of ReactionType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReactionTypeImplCopyWith<_$ReactionTypeImpl> get copyWith =>
      __$$ReactionTypeImplCopyWithImpl<_$ReactionTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReactionTypeImplToJson(
      this,
    );
  }
}

abstract class _ReactionType implements ReactionType {
  const factory _ReactionType({final int? feedId, final String? reactionType}) =
      _$ReactionTypeImpl;

  factory _ReactionType.fromJson(Map<String, dynamic> json) =
      _$ReactionTypeImpl.fromJson;

  @override
  int? get feedId;
  @override
  String? get reactionType;

  /// Create a copy of ReactionType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReactionTypeImplCopyWith<_$ReactionTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
