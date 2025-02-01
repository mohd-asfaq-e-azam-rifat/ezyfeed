import 'package:equatable/equatable.dart';
import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/data/model/remote/response/feed_item/feed_item.dart';

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
    return FeedState(
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
  final List<FeedItem> feedItems;
  final bool isLastPage;

  const GetFeedState({
    super.uiState = UiState.initial,
    super.message,
    this.feedItems = const [],
    this.isLastPage = false,
  });

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
