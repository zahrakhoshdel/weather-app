import 'package:intl/intl.dart';

class Times {
  int timestamp;

  final String farsi = 'fa';
  final String english = 'en_US';
  final String clock = 'h:mm';
  final String weekDay = 'EEEE';
  final String day = 'd';
  final String month = 'MMMM';
  DateTime now = DateTime.now();

  Times(this.timestamp);
  int get getTimestamp => this.timestamp;

  DateTime time() => DateTime.fromMillisecondsSinceEpoch(getTimestamp * 1000);
  String getClock() => DateFormat(clock, english).format(time());
  // +
  // ' ' +
  // DateFormat('a', farsi).format(time());

  String getWeekDay() => DateFormat(weekDay, english).format(time());
  String getMonth() => DateFormat('$day  $month', english).format(time());
}
