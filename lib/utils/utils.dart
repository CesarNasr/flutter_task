import 'package:intl/intl.dart';

class Utils {
  String getFormattedDate(String dateString) { // iso date formatter
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('EEE, MMM d, ''hh:mm aaa').format(dateTime);
  }


}
