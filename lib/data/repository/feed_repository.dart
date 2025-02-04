import 'package:ezyfeed/data/model/local/exception/exceptions.dart';
import 'package:ezyfeed/data/model/remote/response/comment/comment.dart';
import 'package:ezyfeed/data/model/remote/response/feed_item/feed_item.dart';
import 'package:ezyfeed/data/model/remote/response/reaction_collection/reaction_collection.dart';
import 'package:ezyfeed/data/service/local/feed_local_service.dart';
import 'package:ezyfeed/data/service/remote/feed_remote_service.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class FeedRepository {
  final FeedLocalService _localService;
  final FeedRemoteService _remoteService;

  FeedRepository(
    this._localService,
    this._remoteService,
  );

  // This method returns the feed posts and indicates if it's the last page
  // Send last feed ID from the current list to get next feed items
  Future<(List<FeedItem>, bool)?> getFeed({
    int? lastFeedId,
  }) async {
    try {
      final remoteItems = await _remoteService.getFeed(lastFeedId: lastFeedId);

      if (remoteItems?.isNotEmpty == true) {
        await _localService.syncAndStoreFeedPosts(remoteItems!);

        // The last page is expected to have less than 15 items
        final isLastPage = remoteItems.length < 15;
        return (remoteItems, isLastPage);
      } else {
        // As we've not introduced any local pagination and sending all at once
        final isLastPage = true;
        return (getCachedFeedPosts() ?? [], isLastPage);
      }
    } catch (e) {
      // As we've not introduced any local pagination and sending all at once
      final isLastPage = true;
      return (getCachedFeedPosts() ?? [], isLastPage);
    }
  }

  List<FeedItem>? getCachedFeedPosts() {
    // If fetching from the API fails, return the cached feed items
    final cachedItems = _localService.getCachedFeedPosts();

    if (cachedItems.isNotEmpty == true) {
      return cachedItems;
    } else {
      throw AppException("No feed items found");
    }
  }

  Future<void> updateCachedFeedPost(FeedItem item) {
    return _localService.updateCachedFeedPost(item);
  }

  Future<void> clearCachedFeedPosts() {
    return _localService.clearCachedFeedPosts();
  }

  Future<FeedItem?> createPost({
    required String text,
    required String backgroundColor,
  }) async {
    return _remoteService.createPost(
      text: text,
      backgroundColor: backgroundColor,
    );
  }

  Future<ReactionCollection?> reactOnFeedItem({
    required int feedId,
    required String reaction,
  }) async {
    return _remoteService.reactOnFeedItem(
      feedId: feedId,
      reaction: reaction,
    );
  }

  Future<List<Comment>?> getComments({
    required int feedId,
  }) async {
    return _remoteService.getComments(feedId: feedId);
  }

  Future<List<Comment>?> getReplies({
    required int commentId,
  }) async {
    return _remoteService.getReplies(commentId: commentId);
  }

  Future<Comment?> createComment({
    required int feedId,
    required String text,
  }) async {
    return _remoteService.createComment(
      feedId: feedId,
      text: text,
    );
  }
}
