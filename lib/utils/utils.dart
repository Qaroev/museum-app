import 'dart:convert';

import 'package:intl/intl.dart';

String decodeToLatin(String input) {
  final output = utf8.decode(latin1.encode(input));
  return output;
}

getTime(String time) {
  if (time == '') return '';
  var res = time.split(" ");
  return res[1];
}

List<String> months = [
  'январь',
  'февраль',
  'март',
  'апрель',
  'май',
  'июнь',
  'июль',
  'август',
  'сентябрь',
  'октябрь',
  'ноябрь',
  'декабрь'
];

getMonth(String time) {
  if (time == '') return '';
  var it = time.split(" ");
  var res = it[0].split("-");
  return "${res[2]} ${months[int.parse(res[1]) - 1]}";
}

getMonthAndDate(String time) {
  if (time == '') return '';
  var res = time.split("/");
  return months[int.parse(res[1]) - 1];
}

getWeekName(String time) {
  var dateTime = DateFormat('dd/MM/yyyy').parse(time);
  dynamic dayData =
      '{ "1" : "Пн", "2" : "Вт", "3" : "Ср", "4" : "Чт", "5" : "Пт", "6" : "Сб", "7" : "Вс" }';

  return json.decode(dayData)['${dateTime.weekday}'];
}
