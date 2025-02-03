import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/repository/feed_repository.dart';
import 'package:ezyfeed/ui/feed/feed_event.dart';
import 'package:ezyfeed/ui/feed/feed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepository _feedRepository;

  FeedBloc(this._feedRepository) : super(const FeedState()) {
    on<FeedItemsRequested>(_onFeedItemsRequested);
    on<PostCreationRequested>(_onPostCreationRequested);
  }

  Future<void> _onFeedItemsRequested(
    FeedItemsRequested event,
    Emitter<FeedState> emit,
  ) async {
    try {
      if (event.shouldShowLoading == true) {
        emit(
          GetFeedState(
            uiState: UiState.loading,
          ),
        );
      }

      final result = await _feedRepository.getFeed(
        lastFeedId: event.lastFeedId,
      );

      final feedItems = result?.$1;
      final isLastPage = result?.$2;

      if (feedItems != null) {
        if (event.lastFeedId != null &&
            state is GetFeedState &&
            (state as GetFeedState).feedItems.isNotEmpty == true) {
          emit(
            (state as GetFeedState).addWith(
              uiState: UiState.successful,
              feedItems: feedItems,
              isLastPage: isLastPage,
            ),
          );
        } else {
          emit(
            (state as GetFeedState).copyWith(
              uiState: UiState.successful,
              feedItems: feedItems,
              isLastPage: isLastPage,
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            uiState: UiState.error,
            message: "No feed items found",
          ),
        );
      }
    } on Exception catch (e) {
      emit(
        state.copyWith(
          uiState: UiState.error,
          message: e.getErrorMessage(),
        ),
      );
    }
  }

  Future<void> _onPostCreationRequested(
    PostCreationRequested event,
    Emitter<FeedState> emit,
  ) async {
    try {
      final result = await _feedRepository.createPost(
        text: event.text,
        backgroundColor: event.backgroundColor,
      );

      if (result != null) {
        emit(
          CreatePostState(
            uiState: UiState.successful,
            feedItem: result,
            message: "Post created successfully",
          ),
        );
      } else {
        emit(
          state.copyWith(
            uiState: UiState.error,
            message: "No new feed item found",
          ),
        );
      }
    } on Exception catch (e) {
      emit(
        state.copyWith(
          uiState: UiState.error,
          message: e.getErrorMessage(),
        ),
      );
    }
  }
}
