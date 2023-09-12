class MobileUtil {
  ///Các đầu số di động hợp lệ tại Việt Nam
  static const List<String> prefixMobileList = <String>[
    '086',
    '096',
    '097',
    '098',
    '032',
    '033',
    '034',
    '035',
    '036',
    '037',
    '038',
    '039',
    '088',
    '091',
    '094',
    '083',
    '084',
    '085',
    '081',
    '082',
    '089',
    '090',
    '093',
    '070',
    '079',
    '077',
    '076',
    '078',
    '092',
    '056',
    '058',
    '099',
    '059'
  ];

  /// Chuyển số di động từ dạng 11 ký tự 84912345678 thành 0912345678
  static String to10digit(String mobileNumber) {
    try {
      if (mobileNumber.length == 11 && mobileNumber.substring(0, 2) == '84') {
        return '0${mobileNumber.substring(2)}';
      }
      return mobileNumber;
    } catch (e) {
      return mobileNumber;
    }
  }

  /// Chuyển số di động từ dạng 10 ký tự 0912345678 thành 84912345678
  static String to11digit(String mobileNumber) {
    try {
      if (mobileNumber.length == 10 && mobileNumber.substring(0, 1) == '0') {
        return '84${mobileNumber.substring(1)}';
      }
      return mobileNumber;
    } catch (e) {
      return mobileNumber;
    }
  }
}
