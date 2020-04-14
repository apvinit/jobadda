import 'package:intl/intl.dart';

String formattedDate(String inputString) {
  try {
    var date = DateFormat('dd/MM/yyyy').parse(inputString);
    return DateFormat("dd MMM yyyy").format(date);
  } catch (error) {
    return "";
  }
}
