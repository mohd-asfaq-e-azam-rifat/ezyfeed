part of '../feed_item_widget.dart';

class _CommentBottomSheet extends StatelessWidget {
  final FeedItem item;

  const _CommentBottomSheet({
    super.key,
    required this.item,
  });

  FeedBloc _getBloc() {
    final bloc = getIt<FeedBloc>();

    if (item.id != null) {
      bloc.add(
        CommentsRequested(
          feedId: item.id!,
          shouldShowLoading: true,
        ),
      );
    }

    return bloc;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _getBloc(),
      child: BlocConsumer<FeedBloc, FeedState>(
        listener: (context, state) {
          if (state.uiState.isError == true) {
            if (state.message?.trim().isNotEmpty == true) {
              showToast(message: state.message!.trim());
            }
          }
        },
        builder: (context, state) {
          Widget variableWidget = const SizedBox.shrink();

          switch (state.uiState) {
            case UiState.loading:
              variableWidget = Expanded(
                child: Center(
                  child: BaseDataLoader(),
                ),
              );
              break;

            case UiState.empty:
              variableWidget = Expanded(
                child: Center(
                  child: Text(
                    state.message ?? "",
                    style: textStyleCreatePostAppBarTitle,
                  ),
                ),
              );
              break;

            case UiState.successful:
              final comments = (state as GetCommentState).comments;

              variableWidget = Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    EdgeInsets margin;
                    if (index == comments.length - 1) {
                      margin = const EdgeInsets.only(bottom: 32.0);
                    } else {
                      margin = const EdgeInsets.all(0.0);
                    }

                    return Padding(
                      padding: margin,
                      child: comment.isReply == true
                          ? _ReplyItemWidget(comment: comment)
                          : _CommentItemWidget(comment: comment),
                    );
                  },
                  itemCount: comments.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 16.0);
                  },
                ),
              );
              break;

            default:
              variableWidget = const SizedBox.shrink();
              break;
          }

          return FractionallySizedBox(
            heightFactor: 0.88,
            child: Container(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 24.0,
              ),
              child: Column(
                spacing: 16.0,
                children: [
                  if (item.likeCount != null && item.likeCount! > 0)
                    _ReactionCountWidget(item: item),
                  variableWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CommentItemWidget extends StatelessWidget {
  final Comment comment;

  const _CommentItemWidget({
    super.key,
    required this.comment,
  });

  String _prepareDateTime(String dateTimeAsText) {
    final helper = getIt<DateTimeHelper>();
    final dateTime = helper.toDateTime(dateTimeAsText);

    if (dateTime == null) {
      return "";
    }

    return helper.toTimeAgoShort(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 12.0,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: comment.user?.profilePicture ?? "",
                width: 48.0,
                height: 48.0,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: colorDisabled2.withValues(alpha: 0.5),
                ),
                errorWidget: (context, url, error) => Container(
                  color: colorDisabled2.withValues(alpha: 0.5),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  color: colorCommentBackground,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8.0,
                        children: [
                          Text(
                            comment.user?.fullName ?? "",
                            style: textStyleCommentTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            comment.text ?? "",
                            style: textStyleCommentSubtitle,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      size: 20.0,
                      color: colorFeedItemMoreIcon,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          spacing: 16.0,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 72.0),
              child: Row(
                spacing: 16.0,
                children: [
                  Text(
                    _prepareDateTime(comment.createdAt ?? ""),
                    style: textStyleCommentAction,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Like",
                    style: textStyleCommentAction,
                  ),
                  Text(
                    "Reply",
                    style: textStyleCommentAction,
                  ),
                ],
              ),
            ),
            if (comment.likeCount != null && comment.likeCount! > 0)
              Row(
                spacing: 4.0,
                children: [
                  Text(
                    "${comment.likeCount}",
                    style: textStyleCommentLikeCount,
                  ),
                  SvgPicture.asset(
                    "assets/icons/ic_circular_like.svg",
                    width: 16.0,
                    height: 16.0,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}

class _ReplyItemWidget extends StatelessWidget {
  final Comment comment;

  const _ReplyItemWidget({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 72.0),
      child: Row(
        spacing: 12.0,
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: comment.user?.profilePicture ?? "",
              width: 36.0,
              height: 36.0,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: colorDisabled2.withValues(alpha: 0.5),
              ),
              errorWidget: (context, url, error) => Container(
                color: colorDisabled2.withValues(alpha: 0.5),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: colorCommentBackground,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8.0,
                      children: [
                        Text(
                          comment.user?.fullName ?? "",
                          style: textStyleCommentTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          comment.text ?? "",
                          style: textStyleCommentSubtitle,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    size: 20.0,
                    color: colorFeedItemMoreIcon,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
