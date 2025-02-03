// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reaction_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReactionCollection _$ReactionCollectionFromJson(Map<String, dynamic> json) {
  return _ReactionCollection.fromJson(json);
}

/// @nodoc
mixin _$ReactionCollection {
  int? get totalReactions => throw _privateConstructorUsedError;
  @JsonKey(name: "likeType")
  List<ReactionType>? get reactions => throw _privateConstructorUsedError;

  /// Serializes this ReactionCollection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReactionCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReactionCollectionCopyWith<ReactionCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactionCollectionCopyWith<$Res> {
  factory $ReactionCollectionCopyWith(
          ReactionCollection value, $Res Function(ReactionCollection) then) =
      _$ReactionCollectionCopyWithImpl<$Res, ReactionCollection>;
  @useResult
  $Res call(
      {int? totalReactions,
      @JsonKey(name: "likeType") List<ReactionType>? reactions});
}

/// @nodoc
class _$ReactionCollectionCopyWithImpl<$Res, $Val extends ReactionCollection>
    implements $ReactionCollectionCopyWith<$Res> {
  _$ReactionCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReactionCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReactions = freezed,
    Object? reactions = freezed,
  }) {
    return _then(_value.copyWith(
      totalReactions: freezed == totalReactions
          ? _value.totalReactions
          : totalReactions // ignore: cast_nullable_to_non_nullable
              as int?,
      reactions: freezed == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<ReactionType>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReactionCollectionImplCopyWith<$Res>
    implements $ReactionCollectionCopyWith<$Res> {
  factory _$$ReactionCollectionImplCopyWith(_$ReactionCollectionImpl value,
          $Res Function(_$ReactionCollectionImpl) then) =
      __$$ReactionCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? totalReactions,
      @JsonKey(name: "likeType") List<ReactionType>? reactions});
}

/// @nodoc
class __$$ReactionCollectionImplCopyWithImpl<$Res>
    extends _$ReactionCollectionCopyWithImpl<$Res, _$ReactionCollectionImpl>
    implements _$$ReactionCollectionImplCopyWith<$Res> {
  __$$ReactionCollectionImplCopyWithImpl(_$ReactionCollectionImpl _value,
      $Res Function(_$ReactionCollectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReactionCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReactions = freezed,
    Object? reactions = freezed,
  }) {
    return _then(_$ReactionCollectionImpl(
      totalReactions: freezed == totalReactions
          ? _value.totalReactions
          : totalReactions // ignore: cast_nullable_to_non_nullable
              as int?,
      reactions: freezed == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<ReactionType>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ReactionCollectionImpl
    with DiagnosticableTreeMixin
    implements _ReactionCollection {
  const _$ReactionCollectionImpl(
      {this.totalReactions,
      @JsonKey(name: "likeType") final List<ReactionType>? reactions})
      : _reactions = reactions;

  factory _$ReactionCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReactionCollectionImplFromJson(json);

  @override
  final int? totalReactions;
  final List<ReactionType>? _reactions;
  @override
  @JsonKey(name: "likeType")
  List<ReactionType>? get reactions {
    final value = _reactions;
    if (value == null) return null;
    if (_reactions is EqualUnmodifiableListView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReactionCollection(totalReactions: $totalReactions, reactions: $reactions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReactionCollection'))
      ..add(DiagnosticsProperty('totalReactions', totalReactions))
      ..add(DiagnosticsProperty('reactions', reactions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReactionCollectionImpl &&
            (identical(other.totalReactions, totalReactions) ||
                other.totalReactions == totalReactions) &&
            const DeepCollectionEquality()
                .equals(other._reactions, _reactions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalReactions,
      const DeepCollectionEquality().hash(_reactions));

  /// Create a copy of ReactionCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReactionCollectionImplCopyWith<_$ReactionCollectionImpl> get copyWith =>
      __$$ReactionCollectionImplCopyWithImpl<_$ReactionCollectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReactionCollectionImplToJson(
      this,
    );
  }
}

abstract class _ReactionCollection implements ReactionCollection {
  const factory _ReactionCollection(
          {final int? totalReactions,
          @JsonKey(name: "likeType") final List<ReactionType>? reactions}) =
      _$ReactionCollectionImpl;

  factory _ReactionCollection.fromJson(Map<String, dynamic> json) =
      _$ReactionCollectionImpl.fromJson;

  @override
  int? get totalReactions;
  @override
  @JsonKey(name: "likeType")
  List<ReactionType>? get reactions;

  /// Create a copy of ReactionCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReactionCollectionImplCopyWith<_$ReactionCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
