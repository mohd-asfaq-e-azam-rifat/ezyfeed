import 'dart:convert';
import 'dart:math' as math;

import 'package:ezyfeed/data/helper/date_time/date_time_helper.dart';
import 'package:ezyfeed/injection.dart';
import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<DateTime?> pickDate({
    required int maxDays,
    DateTime? initialDate,
  }) {
    final dateTimeHelper = getIt<DateTimeHelper>();
    initialDate ??= dateTimeHelper.getCurrentDate();

    return showDatePicker(
      context: this,
      initialDate: initialDate,
      firstDate: dateTimeHelper.getCurrentDate(),
      lastDate: dateTimeHelper.getFutureDate(days: maxDays),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
  }
}

extension StringX on String {
  LinearGradient? backgroundCssStyleToLinearGradient() {
    try {
      String style = this;

      // Clean up the string and remove unnecessary escape characters
      style = style.replaceAll(r'\"', '"').replaceAll(r'\\', '');

      // Parse the JSON string
      Map<String, dynamic> jsonMap = jsonDecode(style);

      // Extract the background image if available
      String? backgroundImage = jsonMap["backgroundImage"];

      if (backgroundImage != null &&
          backgroundImage.startsWith("linear-gradient")) {
        // Remove "linear-gradient(" and ")" from the string
        String gradientContent =
            backgroundImage.replaceAll(RegExp(r'linear-gradient\(|\)$'), '');

        // Regular expression to match rgb or rgba values
        RegExp colorRegex =
            RegExp(r'rgb[a]?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d*\.?\d+))?\)');
        RegExp directionRegex = RegExp(r'([-]?\d+)deg');

        // Find and extract the direction part
        RegExpMatch? directionMatch =
            directionRegex.firstMatch(gradientContent);
        double angleInDegrees = directionMatch != null
            ? double.parse(directionMatch.group(1)!)
            : 0.0; // Default to 0 degrees if not found

        final angleInRadians = angleInDegrees.degreesToRadians();

        final endAlignment = angleInDegrees.degreesToEndAlignment();

        // Find all RGB(A) matches
        Iterable<RegExpMatch> colorMatches =
            colorRegex.allMatches(gradientContent);

        List<Color> colors = [];

        for (var match in colorMatches) {
          // Extract RGB values and optional alpha
          int r = int.parse(match.group(1)!);
          int g = int.parse(match.group(2)!);
          int b = int.parse(match.group(3)!);
          double alpha =
              match.group(4) != null ? double.parse(match.group(4)!) : 1.0;

          colors.add(Color.fromRGBO(r, g, b, alpha));
        }

        return LinearGradient(
          begin: -endAlignment,
          end: endAlignment,
          colors: colors,
        );
      }
    } catch (e) {
      // Do nothing
    }

    return null;
  }

  String getReactionIcon() {
    switch (this) {
      case "LIKE":
      case "Like":
      case "like":
        return "assets/icons/ic_circular_like.svg";

      case "LOVE":
      case "Love":
      case "love":
        return "assets/icons/ic_circular_love.svg";

      case "CARE":
      case "Care":
      case "care":
        return "assets/icons/ic_circular_care.svg";

      case "HAHA":
      case "Haha":
      case "haha":
        return "assets/icons/ic_circular_haha.svg";

      case "WOW":
      case "Wow":
      case "wow":
        return "assets/icons/ic_circular_wow.svg";

      case "SAD":
      case "Sad":
      case "sad":
        return "assets/icons/ic_circular_sad.svg";

      case "ANGRY":
      case "Angry":
      case "angry":
        return "assets/icons/ic_circular_angry.svg";

      default:
        return "assets/icons/ic_circular_like.svg";
    }
  }
}

extension ColorX on Color {
  String toHex() {
    // Ignore alpha channel
    return '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
  }
}

extension DoubleX on double {
  Alignment degreesToEndAlignment() {
    final verticalOrHorizontal = _degreesToVerticalOrHorizontalAlignment();
    if (verticalOrHorizontal != null) {
      return verticalOrHorizontal;
    }

    final x = _degreeToX();
    final y = _degreeToY();
    final xAbs = x.abs();
    final yAbs = y.abs();

    if ((0.0 < xAbs && xAbs < 1.0) || (0.0 < yAbs && yAbs < 1.0)) {
      final magnification = (1 / xAbs) < (1 / yAbs) ? (1 / xAbs) : (1 / yAbs);
      return Alignment(x, y) * magnification;
    } else {
      return Alignment(x, y);
    }
  }

  Alignment? _degreesToVerticalOrHorizontalAlignment() {
    var modDeg = this % 360;
    if (this < 0.0 && modDeg != 0.0) {
      modDeg -= 360;
    }

    if (modDeg == 0.0 || modDeg == -0.0) {
      return Alignment.centerRight;
    }
    if (modDeg == 90.0 || modDeg == -270.0) {
      return Alignment.bottomCenter;
    }
    if (modDeg == 180.0 || modDeg == -180.0) {
      return Alignment.centerLeft;
    }
    if (modDeg == 270.0 || modDeg == -90.0) {
      return Alignment.topCenter;
    }

    return null;
  }

  double _degreeToX() {
    final radians = this / 180.0 * math.pi;
    return double.parse(math.cos(radians).toStringAsPrecision(8));
  }

  double _degreeToY() {
    final radians = this / 180.0 * math.pi;
    return double.parse(math.sin(radians).toStringAsPrecision(8));
  }

  double degreesToRadians() => this * math.pi / 180.0;
}
