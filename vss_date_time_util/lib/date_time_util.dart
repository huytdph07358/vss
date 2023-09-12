import 'dart:math';

class DateTimeUtil {
  /// Parse int sang kiểu datetime
  /// dùng cho kiểu dữ liệu trả về của ivt
  /// yyyymmddhhmmss
  /// yyyymmdd
  /// yyyymm
  static DateTime? parse(int? dateTime) {
    try {
      if (dateTime == null) {
        return null;
      }
      if (dateTime > pow(10, 14 - 1)) {
        return DateTime.parse(
            '${dateTime.toString().substring(0, 8)}T${dateTime.toString().substring(8)}');
      }
      if (dateTime > pow(10, 8 - 1)) {
        return DateTime.parse(dateTime.toString().substring(0, 8));
      }
      if (dateTime > pow(10, 6 - 1)) {
        return DateTime.parse('${dateTime.toString().substring(0, 6)}01');
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Parse string theo format được hỗ trợ sẵn vd: dạng dd-MM-yyyy, dd/MM/yyyy sang kiểu datetime
  static DateTime? parseFromString(String dateTime) {
    /// * `"2012-02-27"`
    /// * `"2012-02-27 13:27:00"`
    /// * `"2012-02-27 13:27:00.123456789z"`
    /// * `"2012-02-27 13:27:00,123456789z"`
    /// * `"20120227 13:27:00"`
    /// * `"20120227T132700"`
    /// * `"20120227"`
    /// * `"+20120227"`
    /// * `"2012-02-27T14Z"`
    /// * `"2012-02-27T14+00:00"`
    /// * `"-123450101 00:00:00 Z"`: in the year -12345.
    /// * `"2002-02-27T14:00:00-0500"`: Same as `"2002-02-27T19:00:00Z"`
    try {
      final String strDate =
          '${dateTime.toString().substring(6, 10)}-${dateTime.toString().substring(3, 5)}-${dateTime.toString().substring(0, 2)}';
      return DateTime.parse(strDate);
    } catch (e) {
      return null;
    }
  }

  /// Trả về datetime giá trị kiểu số dạng yyyymmddhhmmss
  static int? toNumber(DateTime dateTime) {
    try {
      return int.tryParse(
          "${dateTime.year.toString()}${dateTime.month.toString().padLeft(2, '0')}${dateTime.day.toString().padLeft(2, '0')}${dateTime.hour.toString().padLeft(2, '0')}${dateTime.minute.toString().padLeft(2, '0')}${dateTime.second.toString().padLeft(2, '0')}");
    } catch (e) {
      return null;
    }
  }

  /// Hàm ghép ngày (20220523000000) và thời gian ('0556' hoặc '055634') do backend của ivt trả về để tạo ra 1 trường kiểu datetime
  static DateTime? concatenate(int date, String time) {
    try {
      if (time.length > 6) {
        return null;
      }
      return parse(date + int.parse(time.padRight(6, '0')));
    } catch (e) {
      return null;
    }
  }
}
