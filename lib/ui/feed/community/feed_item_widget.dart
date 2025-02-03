import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezyfeed/base/helper/debounce.dart';
import 'package:ezyfeed/base/navigation/navigation.dart';
import 'package:ezyfeed/base/widget/toast/toast.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/data/extensions.dart';
import 'package:ezyfeed/data/helper/date_time/date_time_helper.dart';
import 'package:ezyfeed/data/model/remote/response/feed_item/feed_item.dart';
import 'package:ezyfeed/injection.dart';
import 'package:ezyfeed/ui/extensions.dart';
import 'package:ezyfeed/ui/feed/feed_bloc.dart';
import 'package:ezyfeed/ui/feed/feed_event.dart';
import 'package:ezyfeed/ui/feed/feed_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'comment_button.dart';
part 'comment_count_widget.dart';
part 'reaction_button.dart';
part 'reaction_button_content_widget.dart';
part 'reaction_count_widget.dart';
part 'text_content_widget.dart';
part 'user_profile_widget.dart';

class FeedItemWidget extends StatelessWidget {
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
          _UserProfileWidget(item: item),
          Container(
            width: double.maxFinite,
            height: 0.64,
            color: colorBorder1,
          ),
          _TextContentWidget(item: item),
          if (item.likeCount != 0 || item.commentCount != 0)
            Row(
              spacing: 32.0,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ReactionCountWidget(item: item),
                if (item.commentCount != null && item.commentCount! > 0)
                  _CommentCountWidget(item: item),
              ],
            ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              spacing: 32.0,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _MyReactionButton(item: item),
                _MyCommentButton(item: item),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
