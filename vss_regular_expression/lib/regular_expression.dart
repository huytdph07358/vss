class RegularExpression {
  static final RegExp onlyLetter = RegExp('[a-zA-Z]');
  static final RegExp onlyNumber = RegExp(r'\d'); //tương đương [0-9]
  static final RegExp notNumber = RegExp(r'\D'); //tương đương [^0-9]
}
