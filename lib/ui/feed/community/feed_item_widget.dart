import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezyfeed/base/navigation/navigation.dart';
import 'package:ezyfeed/base/widget/toast/toast.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/helper/date_time/date_time_helper.dart';
import 'package:ezyfeed/data/model/remote/response/feed_item/feed_item.dart';
import 'package:ezyfeed/injection.dart';
import 'package:ezyfeed/ui/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedItemWidget extends StatelessWidget {
  final FeedItem item;

  const FeedItemWidget({
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
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.0,
        children: [
          Row(
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
          ),
          Container(
            width: double.maxFinite,
            height: 0.64,
            color: colorBorder1,
          ),
          item.backgroundColor != null
              ? Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    gradient: _getBackgroundGradient(),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: _linkifyText(context, item.feedText ?? ""),
                    textAlign: TextAlign.start,
                  ),
                )
              : RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: _linkifyText(context, item.feedText ?? ""),
                  textAlign: TextAlign.start,
                ),
          if (item.likeCount != 0 && item.commentCount != 0)
            Row(
              spacing: 32.0,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _getReactionCount(item),
                if (item.commentCount != null && item.commentCount! > 0)
                  Row(
                    spacing: 6.0,
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
              ],
            ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              spacing: 32.0,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _getReactionButton(item),
                Row(
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getReactionButton(FeedItem item) {
    Widget reactionButton;
    final noReactionPlaceholder = Reaction<String>(
      value: null,
      icon: ReactionContentWidget(
        iconPath: "assets/icons/ic_like_outlined.svg",
        title: "Like",
        foregroundColor: colorNoReaction,
        fontWeight: FontWeight.w600,
      ),
    );

    final onClickReaction = item.myReaction?.reactionType
            ?.toReactionKey()
            .prepareReactionWidget() ??
        UserReaction.like.prepareReactionWidget();

    reactionButton = ReactionButton<String>(
      onReactionChanged: (Reaction<String>? reaction) {
        debugPrint('Selected value: ${reaction?.value}');

        // TODO: Add debounce at first
        // TODO: Call API to clear reaction
        // TODO: Call API to react for the post
      },
      reactions: <Reaction<String>>[
        UserReaction.like.prepareReactionWidget(),
        UserReaction.love.prepareReactionWidget(),
        UserReaction.care.prepareReactionWidget(),
        UserReaction.haha.prepareReactionWidget(),
        UserReaction.wow.prepareReactionWidget(),
        UserReaction.sad.prepareReactionWidget(),
        UserReaction.angry.prepareReactionWidget(),
      ],
      selectedReaction: onClickReaction,
      itemSize: const Size.square(32.0),
      placeholder: noReactionPlaceholder,
      isChecked: item.hasMyReaction,
    );

    return reactionButton;
  }

  LinearGradient _getBackgroundGradient() {
    final defaultBackground = LinearGradient(
      begin: Alignment(-1.0, 0.0),
      end: Alignment(1.0, 0.0),
      transform: GradientRotation(90),
      colors: [
        Color(0xFFFFFFFF),
        Color(0xFFFFFFFF),
      ],
    );

    var background = item.backgroundColor?.backgroundCssStyleToLinearGradient();
    return background ?? defaultBackground;
  }

  TextSpan _linkifyText(BuildContext context, String text) {
    final RegExp linkRegExp = RegExp(
      Regex.linkRegex,
      caseSensitive: false,
    );

    final List<TextSpan> children = [];
    int startIndex = 0;

    final matches = linkRegExp.allMatches(text);

    for (final match in matches) {
      // Add the text before the link
      if (match.start > startIndex) {
        children.add(
          TextSpan(
            text: text.substring(startIndex, match.start),
            style: textStyleFeedItemBodyRegular,
          ),
        );
      }

      // Add the link
      final String url = match.group(0)!;
      children.add(
        TextSpan(
          text: url,
          style: textStyleFeedItemBodyLink,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              try {
                url.launchExternalUrl(context);
              } on Exception catch (e) {
                showToast(message: e.getErrorMessage());
              }
            },
        ),
      );

      startIndex = match.end;
    }

    // Add any remaining text after the last link
    if (startIndex < text.length) {
      children.add(
        TextSpan(
          text: text.substring(startIndex),
          style: textStyleFeedItemBodyRegular,
        ),
      );
    }

    return TextSpan(children: children);
  }

  Widget _getReactionCount(FeedItem item) {
    final defaultWidget = Container(
      color: Colors.transparent,
      width: 100.0,
      height: 20.0,
    );

    String title;
    if (item.hasMyReaction == true) {
      title = "You and ${item.likeCount! - 1} others";
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
              width: 20.0,
              height: 20.0,
            );
          } else {
            reactionSet = SvgPicture.asset(
              defaultIconPath,
              width: 20.0,
              height: 20.0,
            );
          }
          break;

        case 1:
          final reactionType = item.reactions?.first.reactionType;
          reactionSet = SvgPicture.asset(
            reactionType?.getReactionPreviewIconPath() ?? defaultIconPath,
            width: 20.0,
            height: 20.0,
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
            width: 35.0,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                  left: 15,
                  child: SvgPicture.asset(
                    secondReaction?.getReactionPreviewIconPath() ??
                        defaultIconPath,
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
                SvgPicture.asset(
                  firstReaction?.getReactionPreviewIconPath() ??
                      defaultIconPath,
                  width: 20.0,
                  height: 20.0,
                ),
              ],
            ),
          );
          break;
      }

      return Row(
        spacing: 6.0,
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

class ReactionContentWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final Color foregroundColor;
  final FontWeight fontWeight;
  final double fontSize;

  const ReactionContentWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.foregroundColor,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.0,
      height: 20.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 20.0,
            height: 20.0,
          ),
          const SizedBox(width: 6.0),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: fontFamilyFigtree,
                color: foregroundColor,
                fontWeight: fontWeight,
                fontSize: fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
