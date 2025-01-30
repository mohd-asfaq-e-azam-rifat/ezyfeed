import 'package:ezyfeed/base/navigation/navigation.dart';
import 'package:ezyfeed/base/state/basic/basic_state.dart';
import 'package:ezyfeed/base/widget/loader/base_data_loader.dart';
import 'package:ezyfeed/base/widget/toast/toast.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/model/remote/response/feed_item/feed_item.dart';
import 'package:ezyfeed/injection.dart';
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
    final bloc = getIt<FeedBloc>();
    bloc.add(FeedItemsRequested());

    return bloc;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getBloc(context),
      child: BlocConsumer<FeedBloc, FeedState>(
        listener: (context, state) {
          if (state.uiState.isError == true) {
            if (state.message?.trim().isNotEmpty == true) {
              showToast(message: state.message!.trim());
            }
          }
        },
        builder: (context, state) {
          if (state.uiState.isLoading == true) {
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
          } else if (state.uiState.isSuccessful == true &&
              (state as GetFeedState).feedItems?.isNotEmpty == true) {
            final items = state.feedItems!;

            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return WriteForFeedWidget();
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
  // TODO: Remove the following
  final _sampleText =
      "Hello everyone, this is a post from app to see if attached link"
      " is working or not. Here is a link https://picsum.photos/1280/720"
      " But I think this is not working. This should work but not working!!!!";

  final FeedItem item;

  const FeedItemWidget({
    super.key,
    required this.item,
  });

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
                child: Image.asset(
                  "assets/icons/ic_user_avatar.webp",
                  fit: BoxFit.contain,
                  width: 34.0,
                  height: 34.0,
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
                    // TODO: mechanism to convert date-time to display text
                    Text(
                      "2 days ago",
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
          RichText(
            textScaler: MediaQuery.of(context).textScaler,
            text: _linkifyText(context, item.feedText ?? ""),
            maxLines: 4,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
          if (item.fileType != FileType.text)
            Image.network(
              "https://picsum.photos/1280/720",
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: 162.0,
            ),
          Row(
            spacing: 32.0,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TODO: replace the widget with reactions
              Container(
                color: Colors.transparent,
                width: 100.0,
                height: 20.0,
              ),
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
        ],
      ),
    );
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
}
