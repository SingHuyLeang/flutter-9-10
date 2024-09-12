import 'package:intl/intl.dart';

class NDateTime {
  static String getCurrentDate() {
    return DateFormat("dd MMM yyyy").format(DateTime.now());
  }
  static String getCurrentTime() {
    return DateFormat("h:mm a").format(DateTime.now());
  }
}
