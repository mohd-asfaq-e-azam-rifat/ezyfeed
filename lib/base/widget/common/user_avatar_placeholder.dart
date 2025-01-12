import 'package:ezyfeed/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserAvatarErrorPlaceholder extends StatelessWidget {
  final _standardPaddingRatio = 0.2125;

  final double size;
  final double? padding;
  final Color borderColor;
  final Color backgroundColor;

  const UserAvatarErrorPlaceholder({
    super.key,
    required this.size,
    this.padding,
    this.borderColor = colorGray3,
    this.backgroundColor = colorBackground8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(
        padding ?? (size * _standardPaddingRatio),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: borderColor,
            width: 1.5,
          ),
        ),
        color: backgroundColor,
      ),
      child: SvgPicture.asset(
        "assets/icons/ic_user_placeholder.svg",
        colorFilter: const ColorFilter.mode(
          colorGray9,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

class UserAvatarLoadingPlaceholder extends StatelessWidget {
  final double size;
  final Color? backgroundColor;

  const UserAvatarLoadingPlaceholder({
    super.key,
    required this.size,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? Colors.grey.shade300,
      ),
    );
  }
}
