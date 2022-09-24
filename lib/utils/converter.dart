import 'package:intl/intl.dart';

class Converter {
  static String getResult(double value, bool isDot) {
    try {
      if (isDot) return '${value.toString().split('.').first}.';
      if (value == 0) return '0';
      if (value < 1.0) return value.toStringAsFixed(2).replaceAll('.', ',');

      List<String> listString = value.toString().split('.');

      if (listString.last == '00') {
        return listString.first;
      } else {
        final formatter = NumberFormat("###,####,###.##");
        return formatter.format(value);
      }
    } catch (e) {
      return '';
    }
  }
}
