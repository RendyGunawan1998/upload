import 'package:intl/intl.dart';
import 'package:baru_nih/utils/all_translate.dart';

class MyDateFormat {
  static String convertDateFromString(String strDate) {
    DateTime dateTime = DateTime.parse(strDate);
    // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
    String formattedDate = DateFormat('E, dd/MM/yyyy').format(dateTime);
    return formattedDate;
  }

  static String convertDateFromStringShort(String strDate) {
    DateTime dateTime = DateTime.parse(strDate);
    // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
    String formattedDate = DateFormat('E, dd MMM').format(dateTime);
    return formattedDate;
  }

  static String convertHourFromString(String strDate) {
    DateTime dateTime = DateTime.parse(strDate);
    // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
    String formattedDate = DateFormat('kk:mm').format(dateTime);
    return formattedDate;
  }

  static String convertDateFromStringGeneral(String strDate) {
    if (strDate != null && strDate != "0" && strDate != "-") {
      DateTime dateTime = DateTime.parse(strDate);
      // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
      String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
      return formattedDate;
    }
    return "-";
  }

  static String convertDateFromStringHuman(String strDate) {
    if (strDate != null && strDate != "0" && strDate != "-") {
      var tahun = strDate.substring(0, 4);
      var bulan = strDate.substring(4, 6);
      DateTime dateTime = DateTime.parse(tahun + "-" + bulan + "-01");
      DateFormat dateFormat = new DateFormat.yMMMM('id');
      String formattedDate = dateFormat.format(dateTime);
      return formattedDate;
    }
    return "-";
  }

  static String getCurrentYear() {
    String formattedDate = DateFormat('yyyy').format(DateTime.now());
    return formattedDate;
  }

  static String getCurrentMonth() {
    String formattedDate = DateFormat('MM').format(DateTime.now());
    return formattedDate;
  }

  static String getCurrentDate() {
    String formattedDate = DateFormat('d').format(DateTime.now());
    return formattedDate;
  }

  static String calculateAge(String strDate) {
    if (strDate != null && strDate != "0" && strDate != "-") {
      DateTime birthDate = DateTime.parse(strDate);
      DateTime currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;
      int month1 = currentDate.month;
      int month2 = birthDate.month;
      if (month2 > month1) {
        age--;
      } else if (month1 == month2) {
        int day1 = currentDate.day;
        int day2 = birthDate.day;
        if (day2 > day1) {
          age--;
        }
      }
      return age.toString() + " " + allTranslations.text("years_old");
    }
    return "-";
  }
}
