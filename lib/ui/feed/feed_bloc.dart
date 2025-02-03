import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/model/remote/response/comment/comment.dart';
import 'package:ezyfeed/data/model/remote/response/like/like.dart';
import 'package:ezyfeed/data/repository/feed_repository.dart';
import 'package:ezyfeed/ui/extensions.dart';
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
    on<ReactionRequested>(_onReactionRequested);
    on<CommentsRequested>(_onCommentsRequested);
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

  Future<void> _onReactionRequested(
    ReactionRequested event,
    Emitter<FeedState> emit,
  ) async {
    try {
      final result = await _feedRepository.reactOnFeedItem(
        feedId: event.feedId,
        reaction: event.reaction,
      );

      if (state is GetFeedState) {
        final feedItems = (state as GetFeedState).feedItems;

        final indexOfCurrentItem = feedItems.indexWhere(
          (element) {
            return element.id == event.feedId;
          },
        );

        if (indexOfCurrentItem != -1) {
          final oldItem = feedItems[indexOfCurrentItem];
          final oldReaction = oldItem.myReaction?.reactionType?.toReactionKey();
          final currentReaction = event.reaction;
          Like? reactionToBeSet;

          // New reaction case
          if (oldReaction == null) {
            reactionToBeSet = Like(
              feedId: event.feedId,
              userId: oldItem.user?.id,
              reactionType: currentReaction,
            );
          } else {
            // Remove reaction case
            if (oldReaction == currentReaction) {
              reactionToBeSet = Like(
                feedId: event.feedId,
              );
            } else {
              // Update reaction case
              reactionToBeSet = Like(
                feedId: event.feedId,
                userId: oldItem.user?.id,
                reactionType: currentReaction,
              );
            }
          }

          final updatedItem = oldItem.copyWith(
            reactions: result?.reactions,
            likeCount: result?.totalReactions,
            myReaction: reactionToBeSet,
          );

          feedItems[indexOfCurrentItem] = updatedItem;
          await _feedRepository.updateCachedFeedPost(updatedItem);

          emit(
            (state as GetFeedState).copyWith(
              feedItems: feedItems,
            ),
          );
        }
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

  Future<void> _onCommentsRequested(
    CommentsRequested event,
    Emitter<FeedState> emit,
  ) async {
    try {
      if (event.shouldShowLoading == true) {
        emit(
          GetCommentState(
            uiState: UiState.loading,
          ),
        );
      }

      final comments = await _feedRepository.getComments(
        feedId: event.feedId,
      );

      if (comments == null) {
        emit(
          state.copyWith(
            uiState: UiState.error,
            message: "Could not fetch comments",
          ),
        );

        return;
      }

      List<Future<List<Comment>?>> replyFetchingFutures = [];

      for (Comment comment in comments) {
        if (comment.hasReplies == true && comment.id != null) {
          // If comment has replies, add the fetching future to the list
          replyFetchingFutures.add(
            _feedRepository.getReplies(commentId: comment.id!),
          );
        } else {
          // If no replies, no need to fetch
          replyFetchingFutures.add(
            Future.value([]),
          );
        }
      }

      // Fetch all replies in parallel
      List<List<Comment>?> allReplies = await Future.wait(replyFetchingFutures);

      List<Comment> finalList = [];
      for (int i = 0; i < comments.length; i++) {
        final comment = comments[i];
        finalList.add(comment);

        if (comment.hasReplies == true) {
          finalList.addAll(allReplies[i] ?? []);
        }
      }

      if (finalList.isEmpty == true) {
        emit(
          state.copyWith(
            uiState: UiState.empty,
            message: "No comments to display.",
          ),
        );
      } else {
        emit(
          (state as GetCommentState).copyWith(
            uiState: UiState.successful,
            comments: finalList,
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
