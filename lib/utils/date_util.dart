import 'package:intl/intl.dart';

class DateUtil {
  static const monthInIndonesian = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  static const monthInEnglish = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static String convertToLocalFormat(String dtm) {
    try {
      var dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
      var localFormat = DateFormat("dd MMMM yyyy, HH:mm");
      var dateTime = dateFormat.parse(dtm);
      var formatted = localFormat.format(dateTime.toLocal());
      var splitString = formatted.split(" ");
      var month = splitString.elementAt(1);
      var monthInIndonesia =
          monthInIndonesian.elementAt(monthInEnglish.indexOf(month));
      return "${splitString[0]} $monthInIndonesia ${splitString[2]} ${splitString[3]} WIB";
    } catch (e) {
      return "";
    }
  }
}
