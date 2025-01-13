import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/ui/extensions.dart';
import 'package:flutter/material.dart';

class BaseTextFormField extends StatefulWidget {
  final int maxLength;
  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType textInputType;
  final double spaceBetweenTitleAndForm;

  const BaseTextFormField({
    super.key,
    required this.title,
    required this.controller,
    this.hintText = "",
    this.textInputType = TextInputType.text,
    this.maxLength = 50,
    this.spaceBetweenTitleAndForm = 8.0,
  });

  @override
  State<BaseTextFormField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<BaseTextFormField> {
  late int _textLength;
  late bool _isPasswordObscure;
  late FocusNode textFieldFocusNode;

  @override
  void initState() {
    _textLength = 0;
    _isPasswordObscure = true;
    textFieldFocusNode = FocusNode();
    super.initState();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;

      // If focus is on text field, don't un-focus
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      }

      // Prevents focus if tap on eye
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: textStyleFormTitle.copyWith(
            color: colorText1.withValues(alpha: 0.5),
          ),
        ),
        SizedBox(height: widget.spaceBetweenTitleAndForm),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.12),
            border: Border.all(
              color: colorBorder1.withValues(alpha: 0.2),
              width: 1.22,
            ),
            color: Colors.white.withValues(alpha: 0.1),
          ),
          child: TextFormField(
            keyboardType: widget.textInputType,
            style: textStyleFormText,
            minLines: 1,
            maxLines: 1,
            controller: widget.controller,
            onTapOutside: (event) {
              context.hideKeyboard();
            },
            obscureText: _isPasswordObscure,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: widget.hintText,
              counterText: "",
              contentPadding: const EdgeInsets.only(
                left: 14.63,
                right: 14.63,
                top: 9.75,
                bottom: 9.75,
              ),
              hintStyle: textStyleFormText.copyWith(
                color: colorText1.withValues(alpha: 0.3),
              ),
              suffixIconColor: colorAccent,
              suffixIcon: widget.textInputType == TextInputType.visiblePassword
                  ? Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: GestureDetector(
                          onTap: _togglePasswordVisibility,
                          child: Icon(
                            _isPasswordObscure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
            maxLength: widget.maxLength,
            onChanged: (value) {
              setState(() {
                _textLength = value.length;
              });
            },
          ),
        ),
      ],
    );
  }
}
