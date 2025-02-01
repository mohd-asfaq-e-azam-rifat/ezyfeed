import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezyfeed/base/navigation/navigation.dart';
import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/base/widget/loader/base_data_loader.dart';
import 'package:ezyfeed/base/widget/toast/toast.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/helper/date_time/date_time_helper.dart';
import 'package:ezyfeed/data/model/remote/response/feed_item/feed_item.dart';
import 'package:ezyfeed/injection.dart';
import 'package:ezyfeed/ui/extensions.dart';
import 'package:ezyfeed/ui/feed/community/write_for_feed_widget.dart';
import 'package:ezyfeed/ui/feed/feed_bloc.dart';
import 'package:ezyfeed/ui/feed/feed_event.dart';
import 'package:ezyfeed/ui/feed/feed_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  FeedBloc _getBloc(BuildContext context) {
    final bloc = context.read<FeedBloc>();
    bloc.add(FeedItemsRequested());

    return bloc;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedBloc>.value(
      value: _getBloc(context),
      child: BlocConsumer<FeedBloc, FeedState>(
        listener: (context, state) {
          if (state.uiState.isError == true) {
            if (state.message?.trim().isNotEmpty == true) {
              showToast(message: state.message!.trim());
            }
          }

          if (state is CreatePostState && state.uiState.isSuccessful == true) {
            if (state.message?.trim().isNotEmpty == true) {
              showToast(message: state.message!.trim());
            }

            final bloc = context.read<FeedBloc>();
            bloc.add(FeedItemsRequested());
          }
        },
        builder: (context, state) {
          if (state is GetFeedState && state.uiState.isLoading == true) {
            return Column(
              spacing: 24.0,
              children: [
                WriteForFeedWidget(),
                Expanded(
                  child: Center(
                    child: BaseDataLoader(),
                  ),
                ),
              ],
            );
          } else if (state is GetFeedState &&
              state.uiState.isSuccessful == true &&
              state.feedItems?.isNotEmpty == true) {
            final items = state.feedItems!;

            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return WriteForFeedWidget();
                } else if (index == items.length) {
                  final adjustedIndex = index - 1;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: FeedItemWidget(item: items[adjustedIndex]),
                  );
                } else {
                  final adjustedIndex = index - 1;
                  return FeedItemWidget(item: items[adjustedIndex]);
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 24.0);
              },
              itemCount: items.length + 1,
            );
          } else {
            return Column(
              spacing: 24.0,
              children: [
                WriteForFeedWidget(),
                Expanded(
                  child: const SizedBox.expand(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

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
                  fit: BoxFit.contain,
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
                Container(
                  color: Colors.transparent,
                  width: 100.0,
                  height: 20.0,
                ),
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
          reactionSet = SvgPicture.asset(
            defaultIconPath,
            width: 20.0,
            height: 20.0,
          );
          break;

        case 1:
          final reactionType = item.reactions?.first.reactionType;
          reactionSet = SvgPicture.asset(
            reactionType?.getReactionIcon() ?? defaultIconPath,
            width: 20.0,
            height: 20.0,
          );
          break;

        default:
          final firstReaction = item.reactions?.first.reactionType;
          final secondReaction = item.reactions?[1].reactionType;

          reactionSet = SizedBox(
            width: 35.0,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                  left: 15,
                  child: SvgPicture.asset(
                    secondReaction?.getReactionIcon() ?? defaultIconPath,
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
                SvgPicture.asset(
                  firstReaction?.getReactionIcon() ?? defaultIconPath,
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
