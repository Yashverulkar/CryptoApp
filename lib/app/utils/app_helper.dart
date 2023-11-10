import 'package:intl/intl.dart';

class AppHelper {
  static String formatNumber(double number) {
    NumberFormat format = NumberFormat.decimalPattern('en_US');
    String formatted = format.format(number);

    // Remove decimal part and return
    return formatted.split('.')[0];
  }
}
