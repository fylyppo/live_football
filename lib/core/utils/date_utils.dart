library utils;

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

  static List<DateTime> monthsList(DateTime currentDateTime) {
    List<DateTime> threeMonths;
    threeMonths = List<DateTime>.generate(3, (index) {
      return DateTime(currentDateTime.year, currentDateTime.month - 1 + index);
    });
    return threeMonths;
  }

  static List<DateTime> daysInMonth(DateTime month) {
    var first = firstDayOfMonth(month);
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

  static int seasonYear(DateTime day) {
    int season;
    if (day.month > 6) {
      season = day.year;
    } else {
      season = day.year - 1;
    }
    return season;
  }
}
