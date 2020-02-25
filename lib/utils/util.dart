import 'package:intl/intl.dart';

String formattedDate(String inputString) {
  var date = DateFormat('dd/MM/yyyy').parse(inputString);
  return DateFormat.yMMMd().format(date);
}
