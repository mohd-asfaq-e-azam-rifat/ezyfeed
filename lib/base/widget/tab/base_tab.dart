import 'package:ezyfeed/base/widget/tab/base_tab_label.dart';
import 'package:flutter/material.dart';

class BaseTab extends StatelessWidget {
  final String title;
  final int count;

  const BaseTab({
    super.key,
    required this.title,
    this.count = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 52.0,
      child: BaseTabLabel(
        title: title,
        count: count,
      ),
    );
  }
}
