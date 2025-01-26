import 'package:ezyfeed/base/navigation/navigation.dart';
import 'package:ezyfeed/base/widget/toast/toast.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/ui/community/write_for_feed_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return WriteForFeedWidget();
              } else {
                final adjustedIndex = index - 1;
                return FeedItemWidget();
              }
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 24.0);
            },
            itemCount: 20 + 1,
          ),
        ),
      ],
    );
  }
}

class FeedItemWidget extends StatelessWidget {
  final _sampleText =
      "Hello everyone, this is a post from app to see if attached link"
      " is working or not. Here is a link https://picsum.photos/1280/720"
      " But I think this is not working. This should work but not working!!!!";

  const FeedItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
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
                      "Alexander John",
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
            text: _linkifyText(context, _sampleText),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
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
                    "12 Comments",
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
