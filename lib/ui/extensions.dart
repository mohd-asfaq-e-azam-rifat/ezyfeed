import 'package:ezyfeed/constants.dart';
import 'package:ezyfeed/data/helper/date_time/date.dart';
import 'package:ezyfeed/data/model/remote/response/base/api_response.dart';
import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<DateTime?> pickDate({
    int maxDays = maxRangeOfLeave,
    DateTime? initialDate,
  }) {
    initialDate ??= getCurrentDate();

    return showDatePicker(
      context: this,
      initialDate: initialDate,
      firstDate: getCurrentDate(),
      lastDate: getFutureDate(days: maxDays),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
  }
}

extension ScrollNotificationX on ScrollNotification? {
  bool onPaginatedScroll({
    required bool isLoadingData,
    required Meta? metaData,
    required void Function(
      BuildContext context,
      int currentPage,
      int nextPage,
    ) onPaginated,
  }) {
    if (this == null || metaData == null) {
      return false;
    }

    final currentScroll = this!.metrics.pixels;
    final maxScroll = this!.metrics.maxScrollExtent;
    final viewportDimension = this!.metrics.viewportDimension;

    if (this is ScrollEndNotification &&
        currentScroll >= maxScroll - (viewportDimension * paginationRatio) &&
        metaData.hasMore == true &&
        isLoadingData == false &&
        metaData.pageNo != null &&
        this!.context != null) {
      onPaginated.call(this!.context!, metaData.pageNo!, metaData.pageNo! + 1);
    }

    return false;
  }
}
