import 'package:intl/intl.dart';

class DateUtil {
  static String convertToLocalFormat(String dtm) {
    try {
      var dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
      var localFormat = DateFormat("dd MMMM yyyy, HH:mm");
      var dateTime = dateFormat.parse(dtm);
      var formatted = localFormat.format(dateTime.toLocal());
      return formatted;
    } catch (e) {
      return "";
    }
  }
}
