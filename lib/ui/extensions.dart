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