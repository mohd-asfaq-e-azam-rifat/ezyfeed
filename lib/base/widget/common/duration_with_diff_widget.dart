import 'package:ezyfeed/base/widget/common/vertical_title_subtitle_widget.dart';
import 'package:flutter/material.dart';

class DurationWithDiffWidget extends StatelessWidget {
  final String startDate, endDate, durationInDays;

  const DurationWithDiffWidget({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.durationInDays,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: VerticalTitleSubtitleWidget(
            title: "From",
            subtitle: startDate,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: VerticalTitleSubtitleWidget(
            title: "To",
            subtitle: endDate,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: VerticalTitleSubtitleWidget(
            title: "Total",
            subtitle: durationInDays,
          ),
        ),
      ],
    );
  }
}
