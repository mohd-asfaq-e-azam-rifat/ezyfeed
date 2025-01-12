import 'package:ezyfeed/constants.dart';
import 'package:flutter/material.dart';

class VerticalTitleSubtitleWidget extends StatelessWidget {
  final String title, subtitle;

  const VerticalTitleSubtitleWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyleVerySmallBody.copyWith(
            color: colorGray2,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4.0),
        Text(
          subtitle,
          style: textStyleSmallBody.copyWith(
            color: colorGray1,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
