import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/ui/extensions.dart';
import 'package:flutter/material.dart';

class BaseOutlineButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? fontSize;

  const BaseOutlineButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.textColor = colorText2,
    this.backgroundColor = Colors.white,
    this.borderColor = colorGray6,
    this.buttonWidth,
    this.buttonHeight,
    this.fontSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = Theme.of(context).outlinedButtonTheme.style;

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: OutlinedButton(
        onPressed: onPressed != null
            ? () {
                context.hideKeyboard();
                onPressed!.call();
              }
            : null,
        style: buttonStyle?.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorGray4;
              } else {
                return textColor;
              }
            },
          ),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: borderColor,
            ),
          ),
          textStyle: MaterialStateProperty.all<TextStyle?>(
            TextStyle(
              fontFamily: fontFamilyRoboto,
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
              height: 1.172,
              letterSpacing: 0.12,
            ),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
