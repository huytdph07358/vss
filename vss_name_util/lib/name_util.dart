class NameUtil {
  /// Cắt tên Việt Nam đầy đủ thành tên, họ và tên đệm
  static List<String>? separateVietnameseName(String fullName) {
    try {
      String? lastName, middleName, firstName;
      final List<String> nameList = fullName.split(' ');
      if (nameList.length == 1) {
        firstName = nameList[0];
        return <String>[firstName];
      } else if (nameList.length == 2) {
        lastName = nameList[0];
        firstName = nameList[1];
        return <String>[firstName, lastName];
      } else {
        lastName = nameList[0];
        firstName = nameList[nameList.length - 1];
        middleName = nameList.sublist(1, nameList.length - 2).join(' ');
        return <String>[firstName, lastName, middleName];
      }
    } catch (e) {
      return null;
    }
  }
}
