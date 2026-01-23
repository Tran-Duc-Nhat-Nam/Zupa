import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  String convert(DateTime object) {
    final formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'Z");
    return formatter.format(object.toUtc());
  }

  static String toShortTime(DateTime object) {
    final formatter = DateFormat('hh:mm');
    return formatter.format(object);
  }

  static String toDate(DateTime object) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(object);
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
    return DateFormat('dd-MM-yyyy HH:mm').parse(json);
  }

  @override
  String toJson(DateTime object) {
    return DateFormat('dd-MM-yyyy HH:mm').format(object);
  }
}
