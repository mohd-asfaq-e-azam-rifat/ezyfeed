// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedItem _$FeedItemFromJson(Map<String, dynamic> json) {
  return _FeedItem.fromJson(json);
}

/// @nodoc
mixin _$FeedItem {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "feed_txt")
  String? get feedText => throw _privateConstructorUsedError;
  String? get activityType => throw _privateConstructorUsedError;
  FileType? get fileType => throw _privateConstructorUsedError;
  int? get likeCount => throw _privateConstructorUsedError;
  int? get commentCount => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  int? get isBackground => throw _privateConstructorUsedError;
  @JsonKey(name: "bg_color")
  String? get backgroundColor => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: "likeType")
  List<ReactionType>? get reactions => throw _privateConstructorUsedError;
  @JsonKey(name: "like")
  Like? get myReaction => throw _privateConstructorUsedError;

  /// Serializes this FeedItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedItemCopyWith<FeedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedItemCopyWith<$Res> {
  factory $FeedItemCopyWith(FeedItem value, $Res Function(FeedItem) then) =
      _$FeedItemCopyWithImpl<$Res, FeedItem>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "feed_txt") String? feedText,
      String? activityType,
      FileType? fileType,
      int? likeCount,
      int? commentCount,
      String? createdAt,
      String? updatedAt,
      int? isBackground,
      @JsonKey(name: "bg_color") String? backgroundColor,
      User? user,
      @JsonKey(name: "likeType") List<ReactionType>? reactions,
      @JsonKey(name: "like") Like? myReaction});

  $UserCopyWith<$Res>? get user;
  $LikeCopyWith<$Res>? get myReaction;
}

/// @nodoc
class _$FeedItemCopyWithImpl<$Res, $Val extends FeedItem>
    implements $FeedItemCopyWith<$Res> {
  _$FeedItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? feedText = freezed,
    Object? activityType = freezed,
    Object? fileType = freezed,
    Object? likeCount = freezed,
    Object? commentCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isBackground = freezed,
    Object? backgroundColor = freezed,
    Object? user = freezed,
    Object? reactions = freezed,
    Object? myReaction = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      feedText: freezed == feedText
          ? _value.feedText
          : feedText // ignore: cast_nullable_to_non_nullable
              as String?,
      activityType: freezed == activityType
          ? _value.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as String?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as FileType?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      commentCount: freezed == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isBackground: freezed == isBackground
          ? _value.isBackground
          : isBackground // ignore: cast_nullable_to_non_nullable
              as int?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      reactions: freezed == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<ReactionType>?,
      myReaction: freezed == myReaction
          ? _value.myReaction
          : myReaction // ignore: cast_nullable_to_non_nullable
              as Like?,
    ) as $Val);
  }

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LikeCopyWith<$Res>? get myReaction {
    if (_value.myReaction == null) {
      return null;
    }

    return $LikeCopyWith<$Res>(_value.myReaction!, (value) {
      return _then(_value.copyWith(myReaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedItemImplCopyWith<$Res>
    implements $FeedItemCopyWith<$Res> {
  factory _$$FeedItemImplCopyWith(
          _$FeedItemImpl value, $Res Function(_$FeedItemImpl) then) =
      __$$FeedItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "feed_txt") String? feedText,
      String? activityType,
      FileType? fileType,
      int? likeCount,
      int? commentCount,
      String? createdAt,
      String? updatedAt,
      int? isBackground,
      @JsonKey(name: "bg_color") String? backgroundColor,
      User? user,
      @JsonKey(name: "likeType") List<ReactionType>? reactions,
      @JsonKey(name: "like") Like? myReaction});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $LikeCopyWith<$Res>? get myReaction;
}

/// @nodoc
class __$$FeedItemImplCopyWithImpl<$Res>
    extends _$FeedItemCopyWithImpl<$Res, _$FeedItemImpl>
    implements _$$FeedItemImplCopyWith<$Res> {
  __$$FeedItemImplCopyWithImpl(
      _$FeedItemImpl _value, $Res Function(_$FeedItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? feedText = freezed,
    Object? activityType = freezed,
    Object? fileType = freezed,
    Object? likeCount = freezed,
    Object? commentCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isBackground = freezed,
    Object? backgroundColor = freezed,
    Object? user = freezed,
    Object? reactions = freezed,
    Object? myReaction = freezed,
  }) {
    return _then(_$FeedItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      feedText: freezed == feedText
          ? _value.feedText
          : feedText // ignore: cast_nullable_to_non_nullable
              as String?,
      activityType: freezed == activityType
          ? _value.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as String?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as FileType?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      commentCount: freezed == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isBackground: freezed == isBackground
          ? _value.isBackground
          : isBackground // ignore: cast_nullable_to_non_nullable
              as int?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      reactions: freezed == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<ReactionType>?,
      myReaction: freezed == myReaction
          ? _value.myReaction
          : myReaction // ignore: cast_nullable_to_non_nullable
              as Like?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$FeedItemImpl extends _FeedItem with DiagnosticableTreeMixin {
  const _$FeedItemImpl(
      {this.id,
      @JsonKey(name: "feed_txt") this.feedText,
      this.activityType,
      this.fileType,
      this.likeCount,
      this.commentCount,
      this.createdAt,
      this.updatedAt,
      this.isBackground,
      @JsonKey(name: "bg_color") this.backgroundColor,
      this.user,
      @JsonKey(name: "likeType") final List<ReactionType>? reactions,
      @JsonKey(name: "like") this.myReaction})
      : _reactions = reactions,
        super._();

  factory _$FeedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedItemImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "feed_txt")
  final String? feedText;
  @override
  final String? activityType;
  @override
  final FileType? fileType;
  @override
  final int? likeCount;
  @override
  final int? commentCount;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final int? isBackground;
  @override
  @JsonKey(name: "bg_color")
  final String? backgroundColor;
  @override
  final User? user;
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
  @JsonKey(name: "like")
  final Like? myReaction;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedItem(id: $id, feedText: $feedText, activityType: $activityType, fileType: $fileType, likeCount: $likeCount, commentCount: $commentCount, createdAt: $createdAt, updatedAt: $updatedAt, isBackground: $isBackground, backgroundColor: $backgroundColor, user: $user, reactions: $reactions, myReaction: $myReaction)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeedItem'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('feedText', feedText))
      ..add(DiagnosticsProperty('activityType', activityType))
      ..add(DiagnosticsProperty('fileType', fileType))
      ..add(DiagnosticsProperty('likeCount', likeCount))
      ..add(DiagnosticsProperty('commentCount', commentCount))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('isBackground', isBackground))
      ..add(DiagnosticsProperty('backgroundColor', backgroundColor))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('reactions', reactions))
      ..add(DiagnosticsProperty('myReaction', myReaction));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.feedText, feedText) ||
                other.feedText == feedText) &&
            (identical(other.activityType, activityType) ||
                other.activityType == activityType) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isBackground, isBackground) ||
                other.isBackground == isBackground) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._reactions, _reactions) &&
            (identical(other.myReaction, myReaction) ||
                other.myReaction == myReaction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      feedText,
      activityType,
      fileType,
      likeCount,
      commentCount,
      createdAt,
      updatedAt,
      isBackground,
      backgroundColor,
      user,
      const DeepCollectionEquality().hash(_reactions),
      myReaction);

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedItemImplCopyWith<_$FeedItemImpl> get copyWith =>
      __$$FeedItemImplCopyWithImpl<_$FeedItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedItemImplToJson(
      this,
    );
  }
}

abstract class _FeedItem extends FeedItem {
  const factory _FeedItem(
      {final int? id,
      @JsonKey(name: "feed_txt") final String? feedText,
      final String? activityType,
      final FileType? fileType,
      final int? likeCount,
      final int? commentCount,
      final String? createdAt,
      final String? updatedAt,
      final int? isBackground,
      @JsonKey(name: "bg_color") final String? backgroundColor,
      final User? user,
      @JsonKey(name: "likeType") final List<ReactionType>? reactions,
      @JsonKey(name: "like") final Like? myReaction}) = _$FeedItemImpl;
  const _FeedItem._() : super._();

  factory _FeedItem.fromJson(Map<String, dynamic> json) =
      _$FeedItemImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: "feed_txt")
  String? get feedText;
  @override
  String? get activityType;
  @override
  FileType? get fileType;
  @override
  int? get likeCount;
  @override
  int? get commentCount;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  int? get isBackground;
  @override
  @JsonKey(name: "bg_color")
  String? get backgroundColor;
  @override
  User? get user;
  @override
  @JsonKey(name: "likeType")
  List<ReactionType>? get reactions;
  @override
  @JsonKey(name: "like")
  Like? get myReaction;

  /// Create a copy of FeedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedItemImplCopyWith<_$FeedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
