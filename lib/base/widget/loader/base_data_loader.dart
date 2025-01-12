import 'package:ezyfeed/constants.dart';
import 'package:flutter/material.dart';

class BaseDataLoader extends StatelessWidget {
  final Color? customColor;
  final double strokeWidth;

  const BaseDataLoader({
    super.key,
    this.customColor,
    this.strokeWidth = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: strokeWidth,
      valueColor: AlwaysStoppedAnimation<Color>(
        customColor ?? colorPrimary,
      ),
    );
  }
}
