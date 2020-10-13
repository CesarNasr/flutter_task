import 'package:intl/intl.dart';

class Utils {
  DateTime getFormattedDate(String dateString) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    return dateFormat.parse(dateString);
  }
}
