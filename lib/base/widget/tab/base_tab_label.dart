import 'package:ezyfeed/constants.dart';
import 'package:flutter/material.dart';

class BaseTabLabel extends StatelessWidget {
  final String title;
  final int count;

  const BaseTabLabel({
    super.key,
    required this.title,
    this.count = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            title,
            softWrap: false,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
          ),
        ),
        if (count > 0) const SizedBox(width: 8.0),
        if (count > 0)
          Container(
            decoration: const BoxDecoration(
              color: colorError1,
              borderRadius: BorderRadius.all(
                Radius.circular(100.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6.0,
                vertical: 2.0,
              ),
              child: Text(
                "$count",
                style: textStyleSmallBody.copyWith(
                  height: 1.33,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
