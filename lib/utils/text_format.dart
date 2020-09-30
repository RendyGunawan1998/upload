import 'package:intl/intl.dart';

class MyTextFormat {
  static String capitalizeFirstLetter(String str) {
    return str[0].toUpperCase() + str.substring(1);
  }

  static String toCurrency(String value) {
    var x = double.parse(value);
    final formatter = new NumberFormat("#,###.##", "en_US");
    return formatter.format(x);
  }

  static void logPrint(Object object) async {
    int defaultPrintLength = 1020;
    if (object == null || object.toString().length <= defaultPrintLength) {
      print(object);
    } else {
      String log = object.toString();
      int start = 0;
      int endIndex = defaultPrintLength;
      int logLength = log.length;
      int tmpLogLength = log.length;
      while (endIndex < logLength) {
        print(log.substring(start, endIndex));
        endIndex += defaultPrintLength;
        start += defaultPrintLength;
        tmpLogLength -= defaultPrintLength;
      }
      if (tmpLogLength > 0) {
        print(log.substring(start, logLength));
      }
    }
  }
}
