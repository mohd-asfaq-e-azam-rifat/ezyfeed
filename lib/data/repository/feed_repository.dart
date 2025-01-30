import 'package:ezyfeed/data/model/remote/response/feed_item/feed_item.dart';
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

  // Send last feed ID from the current list to get next feed items
  Future<List<FeedItem>?> getFeed({
    int? lastFeedId,
  }) async {
    return _remoteService.getFeed(lastFeedId: lastFeedId);
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
}
