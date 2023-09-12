class CardUtil {
  /// Format định dạng hiển thị số thẻ Việt cũng như số thẻ ngân hàng dưới dạng 1234 5678 8765 4321
  static String format(String cardCode) {
    try {
      if (cardCode.length == 16) {
        return '${cardCode.substring(0, 4)} ${cardCode.substring(4, 8)} ${cardCode.substring(8, 12)} ${cardCode.substring(12, 16)}';
      } else {
        return cardCode;
      }
    } catch (e) {
      return cardCode;
    }
  }
}
