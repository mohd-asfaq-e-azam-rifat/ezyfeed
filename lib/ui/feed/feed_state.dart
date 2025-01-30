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
  final List<FeedItem>? feedItems;

  const GetFeedState({
    super.uiState = UiState.initial,
    super.message,
    this.feedItems,
  });

  @override
  GetFeedState copyWith({
    UiState? uiState,
    String? message,
    List<FeedItem>? feedItems,
  }) {
    return GetFeedState(
      uiState: uiState ?? this.uiState,
      message: message ?? this.message,
      feedItems: feedItems ?? this.feedItems,
    );
  }

  @override
  List<Object?> get props => [
        uiState,
        message,
        feedItems,
      ];
}
