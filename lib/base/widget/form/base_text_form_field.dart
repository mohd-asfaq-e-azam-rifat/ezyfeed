import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/ui/extensions.dart';
import 'package:flutter/material.dart';

class BaseTextFormField extends StatefulWidget {
  final int maxLength;
  final TextEditingController controller;
  final String title;
  final String hintText;
  final double spaceBetweenTitleAndForm;

  const BaseTextFormField({
    super.key,
    required this.title,
    required this.controller,
    required this.hintText,
    this.maxLength = 50,
    this.spaceBetweenTitleAndForm = 8.0,
  });

  @override
  State<BaseTextFormField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<BaseTextFormField> {
  int textLength = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: textStyleSectionHeader,
        ),
        SizedBox(height: widget.spaceBetweenTitleAndForm),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: colorBlack.withOpacity(0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.multiline,
                style: textStyleRegularBody.copyWith(
                  height: 1.4,
                  color: colorBlack.withOpacity(0.6),
                ),
                minLines: 3,
                maxLines: 5,
                controller: widget.controller,
                onTapOutside: (event) {
                  context.hideKeyboard();
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: widget.hintText,
                  counterText: "",
                  contentPadding: const EdgeInsets.only(
                    left: 12.0,
                    right: 12.0,
                    top: 12.0,
                    bottom: 4.0,
                  ),
                  hintStyle: textStyleRegularBody.copyWith(
                    height: 1.4,
                    color: colorBlack.withOpacity(0.4),
                  ),
                ),
                maxLength: widget.maxLength,
                onChanged: (value) {
                  setState(() {
                    textLength = value.length;
                  });
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 12.0,
                    bottom: 12.0,
                  ),
                  child: Text(
                    "$textLength/${widget.maxLength}",
                    style: textStyleRegularBody.copyWith(
                      height: 1.4,
                      color: colorBlack.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
