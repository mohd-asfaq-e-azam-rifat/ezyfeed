import 'package:ezyfeed/base/widget/button/base_filled_button.dart';
import 'package:ezyfeed/constants.dart';
import 'package:flutter/material.dart';

class WriteForFeedWidget extends StatelessWidget {
  const WriteForFeedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: navigate to create post screen
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 16.0,
          bottom: 6.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          border: Border.fromBorderSide(
            BorderSide(
              color: colorWriteForFeedBorder,
            ),
          ),
        ),
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 12.0,
        ),
        child: Row(
          spacing: 16.0,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(4.0),
              ),
              child: Image.asset(
                "assets/icons/ic_user_avatar.webp",
                fit: BoxFit.contain,
                width: 54.0,
                height: 60.0,
              ),
            ),
            Expanded(
              child: Text(
                "Write something here...",
                style: textStyleWriteForFeedTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            BaseFilledButton(
              title: "Post",
              onPressed: () {
                // TODO: navigate to create post screen
              },
            ),
          ],
        ),
      ),
    );
  }
}