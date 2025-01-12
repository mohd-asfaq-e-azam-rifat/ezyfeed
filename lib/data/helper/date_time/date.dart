DateTime getCurrentDate() {
  final present = DateTime.now();
  return DateTime(
    present.year,
    present.month,
    present.day,
  );
}

DateTime getFutureDate({required int days}) {
  return getCurrentDate().add(
    Duration(
      days: days - 1,
    ),
  );
}

DateTime getPastDate({required int days}) {
  return getCurrentDate().subtract(
    Duration(
      days: days - 1,
    ),
  );
}

DateTime getLastDateOfCurrentMonth() {
  final today = getCurrentDate();
  final firstDayOfNextMonth = DateTime(
    today.year,
    today.month + 1,
    1,
  );

  return firstDayOfNextMonth.subtract(
    const Duration(days: 1),
  );
}

int countWorkingDays({
  required DateTime startDate,
  required DateTime endDate,
}) {
  // adding one more day to include the start date
  int daysDifference = endDate.difference(startDate).inDays + 1;

  int weekendDays = 0;

  DateTime index = startDate;
  final dayAfterMax = endDate.add(const Duration(days: 1));
  while (index.isBefore(dayAfterMax)) {
    if (index.weekday == DateTime.friday ||
        index.weekday == DateTime.saturday) {
      weekendDays++;
    }

    index = index.add(
      const Duration(days: 1),
    );
  }

  return daysDifference - weekendDays;
}

List<DateTime> getFutureHolidays({required int maxRange}) {
  List<DateTime> list = [];

  DateTime startDate = getCurrentDate();
  DateTime endDate = getFutureDate(days: maxRange);

  DateTime index = startDate;
  final dayAfterMax = endDate.add(const Duration(days: 1));
  while (index.isBefore(dayAfterMax)) {
    if (index.weekday == DateTime.friday) {
      list.add(index);
      index = index.add(
        const Duration(days: 1),
      );
    } else if (index.weekday == DateTime.saturday) {
      list.add(index);
      index = index.add(
        const Duration(days: 6),
      );
    } else {
      index = index.add(
        const Duration(days: 1),
      );
    }
  }

  return list;
}
