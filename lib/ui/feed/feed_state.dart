import 'package:equatable/equatable.dart';
import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/data/model/remote/response/comment/comment.dart';
import 'package:ezyfeed/data/model/remote/response/feed_item/feed_item.dart';
import 'package:ezyfeed/data/model/remote/response/reaction_collection/reaction_collection.dart';

class FeedState extends Equatable {
  final UiState uiState;
  final String? message;

  const FeedState({
    this.uiState = UiState.initial,
    this.message,
  });

  FeedState copyWith({
    UiState? uiState,
    String? message,
  }) {
    return CreatePostState(
      uiState: uiState ?? this.uiState,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        uiState,
        message,
      ];
}

class GetFeedState extends FeedState {
  late final DateTime updatedAt;
  final List<FeedItem> feedItems;
  final bool isLastPage;

  GetFeedState({
    super.uiState = UiState.initial,
    super.message,
    this.feedItems = const [],
    this.isLastPage = false,
  }) {
    updatedAt = DateTime.now();
  }

  @override
  GetFeedState copyWith({
    UiState? uiState,
    String? message,
    List<FeedItem>? feedItems,
    bool? isLastPage,
  }) {
    return GetFeedState(
      uiState: uiState ?? this.uiState,
      message: message ?? this.message,
      feedItems: feedItems ?? this.feedItems,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  GetFeedState addWith({
    UiState? uiState,
    String? message,
    List<FeedItem>? feedItems,
    bool? isLastPage,
    ReactionCollection? reactionCollection,
  }) {
    return GetFeedState(
      uiState: uiState ?? this.uiState,
      message: message ?? this.message,
      feedItems: feedItems != null
          ? (List.of(this.feedItems)..addAll(feedItems))
          : this.feedItems,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  @override
  List<Object?> get props => [
        updatedAt,
        uiState,
        message,
        feedItems,
        isLastPage,
      ];
}

class CreatePostState extends FeedState {
  final FeedItem? feedItem;

  const CreatePostState({
    super.uiState = UiState.initial,
    super.message,
    this.feedItem,
  });

  @override
  CreatePostState copyWith({
    UiState? uiState,
    String? message,
    FeedItem? feedItem,
  }) {
    return CreatePostState(
      uiState: uiState ?? this.uiState,
      message: message ?? this.message,
      feedItem: feedItem ?? this.feedItem,
    );
  }

  @override
  List<Object?> get props => [
        uiState,
        message,
        feedItem,
      ];
}

class GetCommentState extends FeedState {
  late final DateTime updatedAt;
  final List<Comment> comments;
  final bool shouldUpdate;

  GetCommentState({
    super.uiState = UiState.initial,
    super.message,
    this.comments = const [],
    this.shouldUpdate = false,
  }) {
    updatedAt = DateTime.now();
  }

  @override
  GetCommentState copyWith({
    UiState? uiState,
    String? message,
    List<Comment>? comments,
    bool? shouldUpdate,
  }) {
    return GetCommentState(
      uiState: uiState ?? this.uiState,
      message: message ?? this.message,
      comments: comments ?? this.comments,
      shouldUpdate: shouldUpdate ?? this.shouldUpdate,
    );
  }

  @override
  List<Object?> get props => [
        updatedAt,
        uiState,
        message,
        comments,
        shouldUpdate,
      ];
}
