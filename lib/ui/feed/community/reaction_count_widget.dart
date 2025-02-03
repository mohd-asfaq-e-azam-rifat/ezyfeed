part of 'feed_item_widget.dart';

class _ReactionCountWidget extends StatelessWidget {
  final FeedItem item;

  const _ReactionCountWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final defaultWidget = Container(
      color: Colors.transparent,
      width: 100.0,
      height: 20.0,
    );

    final iconSize = Size.square(16.0);

    String title;
    if (item.hasMyReaction == true) {
      if (item.likeCount == 1) {
        title = "You";
      } else {
        title = "You and ${item.likeCount! - 1} others";
      }
    } else {
      title = "${item.likeCount}";
    }

    if (item.likeCount != null && item.likeCount! > 0) {
      final defaultIconPath = "assets/icons/ic_circular_like.svg";
      Widget reactionSet;

      switch (item.reactions?.length) {
        case null:
          if (item.hasMyReaction == true) {
            reactionSet = SvgPicture.asset(
              item.myReaction?.reactionType?.getReactionPreviewIconPath() ??
                  defaultIconPath,
              width: iconSize.width,
              height: iconSize.height,
            );
          } else {
            reactionSet = SvgPicture.asset(
              defaultIconPath,
              width: iconSize.width,
              height: iconSize.height,
            );
          }
          break;

        case 1:
          final reactionType = item.reactions?.first.reactionType;
          reactionSet = SvgPicture.asset(
            reactionType?.getReactionPreviewIconPath() ?? defaultIconPath,
            width: iconSize.width,
            height: iconSize.height,
          );
          break;

        default:
          String? firstReaction;
          String? secondReaction;

          if (item.hasMyReaction == true) {
            firstReaction = item.myReaction?.reactionType;
            secondReaction = item.reactions
                ?.where((e) => e.reactionType != firstReaction)
                .first
                .reactionType;
          } else {
            firstReaction = item.reactions?.first.reactionType;
            secondReaction = item.reactions?[1].reactionType;
          }

          reactionSet = SizedBox(
            width: iconSize.width * 1.75,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                  left: iconSize.width * 0.75,
                  child: SvgPicture.asset(
                    secondReaction?.getReactionPreviewIconPath() ??
                        defaultIconPath,
                    width: iconSize.width,
                    height: iconSize.height,
                  ),
                ),
                SvgPicture.asset(
                  firstReaction?.getReactionPreviewIconPath() ??
                      defaultIconPath,
                  width: iconSize.width,
                  height: iconSize.height,
                ),
              ],
            ),
          );
          break;
      }

      return Row(
        spacing: 4.0,
        children: [
          reactionSet,
          Text(
            title,
            style: textStyleFeedItemCommentCount,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    } else {
      return defaultWidget;
    }
  }
}