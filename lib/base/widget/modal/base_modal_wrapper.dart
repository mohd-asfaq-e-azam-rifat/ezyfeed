import 'package:ezyfeed/constants.dart';
import 'package:flutter/material.dart';

class BaseModalWrapper extends StatelessWidget {
  final Widget child;
  final Color borderColor;

  const BaseModalWrapper({
    super.key,
    required this.child,
    this.borderColor = colorPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.circular(4.0),
                border: Border(
                  left: BorderSide(
                    color: borderColor,
                    width: 8.0,
                  ),
                  right: BorderSide(
                    color: borderColor,
                    width: 8.0,
                  ),
                  bottom: BorderSide(
                    color: borderColor,
                    width: 8.0,
                  ),
                  top: BorderSide(
                    color: borderColor,
                    width: 19.0,
                  ),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Container(
                  color: Colors.white,
                  child: child,
                ),
              ),
            ),
            Container(
              width: 56.0,
              height: 3.0,
              margin: const EdgeInsets.only(top: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
