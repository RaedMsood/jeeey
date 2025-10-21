import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ParseStringTothousandsNumber on String {
  /// Convert a string to number or throw an exception if can't convert it.
  /// [removeComma] is used to remove the comma from the string before converting it to number.
  ///
  /// For example:
  ///
  /// '1000' will be converted to 1000,
  ///
  /// '1,000' will be converted to 1000 if [removeComma] is true
  int toInt({bool removeComma = true}) {
    String value = removeComma ? replaceAll(',', '') : this;
    return int.parse(value);
  }

  // format string date to '01/01/2024 - 02:30 AM'
  String get formatDate {
    List<String> date = split(' ');
    List<String> datePart = date[0].split('-');
    List<String> timePart = date[1].split(':');
    TimeOfDay timeOfDay = TimeOfDay(
      hour: int.parse(timePart[0]),
      minute: int.parse(timePart[1]),
    );
    String hour = timeOfDay.hourOfPeriod.toString();
    String minute = timeOfDay.minute.toString();
    hour = hour.padLeft(2, '0');
    minute = minute.padLeft(2, '0');
    String period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
    String value =
        '${datePart[2]}/${datePart[1]}/${datePart[0]} - $hour:$minute $period';
    return value;
  }

//convert the DateTime.now().toIso8601String() to a readable format
  String getTime() {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('hh:mm a').format(dateTime);
  }
}

extension ColorExtension on String {
  /// Convert a string hex color to Color object if the string is a valid hex color, otherwise throws an exception.
  Color toColor() {
    String formattedColor = toUpperCase().replaceAll('#', '');
    // hex = hex.replaceAll('#', '');
    // if (hex.length == 6) {
    //   hex = 'FF$hex';
    // }
    // return Color(int.parse('0x$hex'));
    if (formattedColor.length == 6) {
      formattedColor = 'FF$formattedColor';
    }
    return Color(int.parse("0x$formattedColor"));
  }

  /// Convert a string hex color to Color object if the string is a valid hex color, otherwise returns null.
  toColorOrNull() {
    try {
      return toColor();
    } catch (e) {
      return null;
    }
  }
}

String dayHour(String date) {
  if (date.isEmpty) return '';

  try {
    return '${todayYesterdayOrDayOfWeek(date)}، ${DateFormat('hh:mm').format(dateTime(date))} ${amPm(date)}';
  } catch (ex) {
    return date;
  }
}

String dayOfWeek(String date) {
  return DateFormat('EEEE', 'ar-YE').format(DateTime.parse(date));
}

String monthName(String date, {String local = 'ar-YE'}) {
  return DateFormat('MMM', local).format(DateTime.parse(date));
}

String dayDate(String date) {
  if (date.isEmpty) return '';

  try {
    return '${dayOfWeek(date)} ${DateFormat('dd').format(DateTime.parse(date))} ${monthName(date)} ';
  } catch (ex) {
    return '';
  }
}

DateTime dateTime(String date) {
  return DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);

  // try {
  // } catch (e) {
  //   print("Error parsing date: $e");
  //   return DateTime.now();
  // }
}

String todayYesterdayOrDayOfWeek(String date) {
  var todayDate = DateTime.now();
  var yesterdayDate = todayDate.subtract(const Duration(days: 1));
  var datetime = DateTime.parse(date);

  String day = dayOfWeek(date);

  if (datetime.month != todayDate.month || datetime.year != todayDate.year) {
    return dayDate(date);
  }

  if (datetime.day != todayDate.day && datetime.day != yesterdayDate.day) {
    return dayDate(date);
  }

  String today = dayOfWeek(todayDate.toString());
  String yesterday = dayOfWeek(yesterdayDate.toString());

  if (day == today) {
    return 'اليوم';
  }

  if (day == yesterday) {
    return 'امس';
  }

  return dayDate(date);
}

String amPm(String date) {
  return DateFormat('a ', 'ar-YE').format(DateTime.parse(date));
}

DateTime fromTime(TimeOfDay time, {DateTime? dateTime}) {
  var now = dateTime ?? DateTime.now();

  return DateTime(now.year, now.month, now.day, time.hour, time.minute);
}

DateTime fromTimeString(String time, {String? dateTime}) {
  var date = DateTime.now();

  if (dateTime != null) {
    date = DateTime.parse('$dateTime $time');
  }

  return date;
}
