import 'package:dio/dio.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/model/remote/response/comment/comment.dart';
import 'package:ezyfeed/data/model/remote/response/feed_item/feed_item.dart';
import 'package:ezyfeed/data/model/remote/response/reaction_collection/reaction_collection.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class FeedRemoteService {
  final Dio _client;

  FeedRemoteService(this._client);

  // Send last feed ID from the current list to get next feed items
  Future<List<FeedItem>?> getFeed({
    int? lastFeedId,
  }) async {
    Response? response;

    response = await _client.postRequest(
      endPoint: urlToGetFeed.appendParamIntoPostfix(
        ApiKey.status,
        ApiValue.feed,
      ),
      data: {
        ApiKey.communityId: ApiValue.defaultCommunityId,
        ApiKey.spaceId: ApiValue.defaultSpaceId,
        if (lastFeedId != null) ApiKey.more: lastFeedId,
      },
    );

    return response?.data != null
        ? (response?.data as List<dynamic>?)
            ?.map((e) => FeedItem.fromJson(e as Map<String, dynamic>))
            .toList()
        : null;
  }

  Future<FeedItem?> createPost({
    required String text,
    required String backgroundColor,
  }) async {
    Response? response;

    response = await _client.postRequest(
      endPoint: urlToCreatePost,
      data: {
        ApiKey.feedText: text,
        ApiKey.communityId: ApiValue.defaultCommunityId,
        ApiKey.spaceId: ApiValue.defaultSpaceId,
        ApiKey.uploadType: ApiValue.defaultUploadType,
        ApiKey.activityType: ApiValue.defaultActivityType,
        ApiKey.backgroundColor: backgroundColor,
        ApiKey.hasBackground: ApiValue.defaultHasBackgroundValue,
      },
    );

    return response?.data != null ? FeedItem.fromJson(response?.data!) : null;
  }

  Future<ReactionCollection?> reactOnFeedItem({
    required int feedId,
    required String reaction,
  }) async {
    Response? response;

    response = await _client.postRequest(
      endPoint: urlToReactOnFeedPost,
      data: {
        ApiKey.feedId: feedId,
        ApiKey.reactionType: reaction,
      },
    );

    return response?.data != null
        ? ReactionCollection.fromJson(response?.data!)
        : null;
  }

  Future<List<Comment>?> getComments({
    required int feedId,
  }) async {
    Response? response;

    response = await _client.getRequest(
      endPoint: urlToGetComments.appendPathIntoUrl(feedId.toString()),
    );

    return response?.data != null
        ? (response?.data as List<dynamic>?)
            ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
            .toList()
        : null;
  }

  Future<List<Comment>?> getReplies({
    required int commentId,
  }) async {
    Response? response;

    response = await _client.getRequest(
      endPoint: urlToGetReplies.appendPathIntoUrl(commentId.toString()),
    );

    return response?.data != null
        ? (response?.data as List<dynamic>?)
            ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
            .toList()
        : null;
  }

  Future<Comment?> createComment({
    required int feedId,
    required String text,
  }) async {
    Response? response;

    response = await _client.postRequest(
      endPoint: urlToCreateComment,
      data: {
        ApiKey.feedId: feedId,
        ApiKey.commentText: text,
      },
    );

    return response?.data != null ? Comment.fromJson(response?.data!) : null;
  }
}
