import 'package:ezyfeed/base/widget/loader/base_data_loader.dart';
import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/ui/extensions.dart';
import 'package:flutter/material.dart';

class BaseFilledButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color textColor;
  final Color backgroundColor;
  final Color progressColor;
  final bool isLoading;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? fontSize;

  const BaseFilledButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.textColor = Colors.white,
    this.backgroundColor = colorPrimary,
    this.progressColor = colorAccent,
    this.isLoading = false,
    this.buttonWidth,
    this.buttonHeight,
    this.fontSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = Theme.of(context).elevatedButtonTheme.style;

    return isLoading
        ? Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: BaseDataLoader(
                  customColor: progressColor,
                  strokeWidth: 2.5,
                ),
              ),
            ),
          )
        : SizedBox(
            width: buttonWidth,
            height: buttonHeight,
            child: ElevatedButton(
              onPressed: onPressed != null
                  ? () {
                      context.hideKeyboard();
                      onPressed!.call();
                    }
                  : null,
              style: buttonStyle?.copyWith(
                foregroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.disabled)) {
                      return colorDisabled2;
                    } else {
                      return textColor;
                    }
                  },
                ),
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.disabled)) {
                      return colorDisabled1;
                    } else {
                      return backgroundColor;
                    }
                  },
                ),
                textStyle: WidgetStateProperty.all<TextStyle?>(
                  TextStyle(
                    fontFamily: fontFamilyFigtree,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                    height: 1.172,
                  ),
                ),
              ),
              child: Text(title),
            ),
          );
  }
}
