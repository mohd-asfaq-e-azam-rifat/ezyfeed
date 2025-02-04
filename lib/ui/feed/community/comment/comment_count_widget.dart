part of '../feed_item_widget.dart';

class _CommentCountWidget extends StatelessWidget {
  final FeedItem item;

  const _CommentCountWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.showBottomSheet(
          builder: (context) {
            return _CommentBottomSheet(item: item);
          },
        );
      },
      child: Row(
        spacing: 4.0,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/ic_comment.svg",
            width: 16.0,
            height: 16.0,
          ),
          Text(
            "${item.commentCount} ${item.commentCount! > 1 ? "Comments" : "Comment"}",
            style: textStyleFeedItemCommentCount,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
