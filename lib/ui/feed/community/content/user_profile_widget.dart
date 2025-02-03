part of '../feed_item_widget.dart';

class _UserProfileWidget extends StatelessWidget {
  final FeedItem item;

  const _UserProfileWidget({
    super.key,
    required this.item,
  });

  String _prepareFeedPostDateTime(String dateTimeAsText) {
    final helper = getIt<DateTimeHelper>();
    final dateTime = helper.toDateTime(dateTimeAsText);

    if (dateTime == null) {
      return "";
    }

    return helper.toTimeAgo(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: item.user?.profilePicture ?? "",
            width: 34.0,
            height: 34.0,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6.0,
            children: [
              Text(
                item.user?.fullName ?? "",
                style: textStyleFeedItemTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                _prepareFeedPostDateTime(item.createdAt ?? ""),
                style: textStyleFeedItemSubtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Icon(
          Icons.more_vert,
          size: 32.0,
          color: colorFeedItemMoreIcon,
        ),
      ],
    );
  }
}
