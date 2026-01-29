import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dart_date/dart_date.dart';
import 'package:intl/intl.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  static String toShortTime(DateTime object) {
    return object.format('h:m');
  }

  static String toDate(DateTime object) {
    return object.format('d/M/y');
  }

  static String getMonthKey(int month) {
    const monthNames = [
      '',
      'january',
      'february',
      'march',
      'april',
      'may',
      'june',
      'july',
      'august',
      'september',
      'october',
      'november',
      'december',
    ];

    if (month < 1 || month > 12) {
      throw ArgumentError('Month must be between 1 and 12');
    }

    return monthNames[month];
  }

  @override
  DateTime fromJson(String json) {
    return DateFormat('d-M-y h:m').tryParse(json) ??
        DateFormat('d-M-y').tryParse(json) ??
        DateTime.now();
  }

  @override
  String toJson(DateTime object) {
    return object.format('d-M-y h:m');
  }
}
