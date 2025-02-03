sealed class FeedEvent {}

class FeedItemsRequested extends FeedEvent {
  final int? lastFeedId;
  final bool shouldShowLoading;

  FeedItemsRequested({
    this.shouldShowLoading = true,
    this.lastFeedId,
  });
}

class PostCreationRequested extends FeedEvent {
  final String text;
  final String backgroundColor;

  PostCreationRequested({
    required this.text,
    required this.backgroundColor,
  });
}

class ReactionRequested extends FeedEvent {
  final int feedId;
  final String reaction;

  ReactionRequested({
    required this.feedId,
    required this.reaction,
  });
}