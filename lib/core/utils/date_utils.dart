library utils;

import 'package:intl/intl.dart';

class DateUtils {
    static const List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  
  static const List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  static List<DateTime> daysInMonth(DateTime month) {
    var first = firstDayOfMonth(month);
    var daysBefore = first.weekday;
    var firstToDisplay = first.subtract(Duration(days: daysBefore));
    var last = lastDayOfMonth(month);

    var daysAfter = 7 - last.weekday;

    if (daysAfter == 0) {
      daysAfter = 7;
    }
    return daysRange(first, last).toList();
  }

  static DateTime firstDayOfMonth(DateTime month) {
    return DateTime(month.year, month.month);
  }

  static DateTime lastDayOfMonth(DateTime month) {
    var beginningNextMonth = (month.month < 12)
        ? DateTime(month.year, month.month + 1, 1)
        : DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(const Duration(days: 1));
  }

  static Iterable<DateTime> daysRange(DateTime first, DateTime last) {
    var listOfDates = List<DateTime>.generate(
        last.day, (i) => DateTime(first.year, first.month, i + 1));
    return listOfDates;
  }
}
