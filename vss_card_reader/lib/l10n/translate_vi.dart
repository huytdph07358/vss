import 'translate.dart';

/// The translations for Vietnamese (`vi`).
class TranslateVi extends Translate {
  TranslateVi([String locale = 'vi']) : super(locale);

  @override
  String get docThe => 'Đọc thẻ';

  @override
  String get tapThe => 'Táp thẻ';

  @override
  String get quetQrcode => 'Quét qrocde';

  @override
  String get boQua => 'Bỏ qua';

  @override
  String get dongY => 'Đồng ý';

  @override
  String get dangXuLy => 'Đang xử lý...';

  @override
  String get duLieuBatBuoc => 'Dữ liệu bắt buộc';

  @override
  String get tiepTuc => 'Tiếp tục';

  @override
  String get xuLyThanhCong => 'Xử lý thành công';

  @override
  String get xuLyThatBai => 'Xử lý thất bại';

  @override
  String get vuiLongDienDayDuThongTinDeTiepTuc => 'Vui lòng nhập đầy đủ thông tin để tiếp tục';

  @override
  String get khongDocDuocKeyHeThong => 'Không đọc được key hệ thống';

  @override
  String get khongDocDuocDuLieuTrenThe => 'Không đọc được dữ liệu trên thẻ';

  @override
  String get thietLapNfcChuaBat => 'Thiết lập nfc chưa được bật';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get kiemTraLienTuc => 'Kiểm tra liên tục';

  @override
  String get iosAlertMessage => 'Giữ iPhone của bạn gần thẻ';

  @override
  String get iosMultipleTagMessage => 'Nhiều thẻ được phát hiện, vui lòng chỉ để lại một thẻ và thử lại.';

  @override
  String get zzz => '';
}
