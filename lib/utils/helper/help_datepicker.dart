import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

showAppDatePicker(BuildContext context,
    {DateTime? selectedDate,
    bool isAllowPastDate = false,
    bool isAllowFutureDate = true}) async {
  selectedDate ??= DateTime.now();

  final DateTime? picked = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: selectedDate,
      firstDate:
          isAllowPastDate ? DateTime(DateTime.now().year - 50) : DateTime.now(),
      lastDate: isAllowFutureDate
          ? DateTime(DateTime.now().year + 1)
          : DateTime.now());

  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
  }
  debugPrint("$selectedDate");
  return DateFormat('yyyy-MM-dd').format(selectedDate).toString();
}

// string date convert to date
converttdatetostring(String date) {
  return DateFormat('yyyy-MM-dd').format(DateTime.parse(date)).toString();
}

// covert date string to date and time
converttdatetostringwithtime(String date) {
  return DateFormat('yyyy-MM-dd HH:mm:ss')
      .format(DateTime.parse(date))
      .toString();
}

// convert date string to with day name
converttdatetoincday(String date) {
  try {
    return DateFormat('dd EEEE yyyy').format(DateTime.parse(date)).toString();
  } catch (e) {
    return DateFormat('dd EEEE yyyy').format(DateTime.now()).toString();
  }
  
}

// check years difference is a 1 year
bool isDifferenceExactlyOneYear(String startDateStr, String endDateStr) {
  // Parse the date strings into DateTime objects
  DateTime startDate = DateTime.parse(startDateStr);
  DateTime endDate = DateTime.parse(endDateStr);

  // Calculate the difference in years
  int yearDifference = endDate.year - startDate.year;

  // Check if the difference is exactly 1 year and the month/day are the same
  return yearDifference == 1 &&
      startDate.month == endDate.month &&
      startDate.day == endDate.day;
}
