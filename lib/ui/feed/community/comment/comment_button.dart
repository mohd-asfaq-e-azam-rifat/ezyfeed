part of '../feed_item_widget.dart';

class _MyCommentButton extends StatelessWidget {
  final FeedItem item;

  const _MyCommentButton({
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
            "assets/icons/ic_comment_dark.svg",
            width: 20.0,
            height: 20.0,
          ),
          Text(
            "Comment",
            style: textStyleFeedItemCommentCount.copyWith(
              color: colorCreatePostCommentIcon,
            ),
          ),
        ],
      ),
    );
  }
}
