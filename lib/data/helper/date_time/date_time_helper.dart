import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@injectable
@lazySingleton
class DateTimeHelper {
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

  // Sample value: 2025-02-01T12:14:11.000+00:00
  DateTime? toDateTime(String value) {
    return DateTime.tryParse(value);
  }

  String toTimeAgo(DateTime date) {
    final Duration difference = DateTime.now().difference(date);

    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} seconds ago";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else if (difference.inDays < 7) {
      int days = difference.inDays;
      return "$days ${days == 1 ? "day" : "days"} ago";
    } else if (difference.inDays < 15) {
      int weeks = (difference.inDays / 7).floor();
      return "$weeks ${weeks == 1 ? "week" : "weeks"} ago";
    } else {
      return DateFormat("dd MMM, yyyy").format(date);
    }
  }
}
