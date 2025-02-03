import 'package:ezyfeed/data/model/remote/response/feed_item/feed_item.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class FeedLocalService {
  // keys
  static const _keyFeedPosts = "feed_posts";

  final GetStorage _box;

  FeedLocalService(this._box);

  Future<void> setFeedPosts(String token) {
    return _box.write(
      _keyFeedPosts,
      token,
    );
  }

  Future<void> syncAndStoreFeedPosts(List<FeedItem> remoteFeedPosts) {
    final cachedItems = _box.read<Map<String, dynamic>>(_keyFeedPosts) ?? {};

    // Update or add new items from the API to the local cache
    for (final item in remoteFeedPosts) {
      cachedItems[item.id.toString()] = item.toJson();
    }

    // Store updated cache
    return _box.write(_keyFeedPosts, cachedItems);
  }

  List<FeedItem> getCachedFeedPosts() {
    final cachedItems = _box.read<Map<String, dynamic>>(_keyFeedPosts) ?? {};
    final list = cachedItems.values.map(
      (json) {
        return FeedItem.fromJson(json);
      },
    ).toList();

    list.sort((a, b) => b.id!.compareTo(a.id!));
    return list;
  }

  Future<void> clearCachedFeedPosts() {
    return _box.remove(_keyFeedPosts);
  }
}
