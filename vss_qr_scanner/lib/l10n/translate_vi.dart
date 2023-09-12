import 'translate.dart';

/// The translations for Vietnamese (`vi`).
class TranslateVi extends Translate {
  TranslateVi([String locale = 'vi']) : super(locale);

  @override
  String get quetMaQr => 'Quét mã QR';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get datQrcoeNamVuaKhungHinh_DuSangVaRoNet => 'Đặt qrcode nằm vừa khung hình, đủ sáng và rõ nét';

  @override
  String get banCanCapQuyenTruyCapCameraMayChoUngDung => 'Bạn cần cấp quyền truy cập camera của máy cho ứng dụng';

  @override
  String get khongTruyCapDuocCameraMay => 'Không truy cập camera của máy';

  @override
  String get choPhepUngDungTruyCapMayAnhCuaBan => 'Cho phép ứng dụng truy cập máy ảnh của bạn?';

  @override
  String get banCanChoPhepCapquyenTruyCapMayAnhCuaBanDeSuDungTrongUngDung => 'Bạn cần cho phép cấp quyền truy cập máy ảnh của bạn để sử dụng trong ứng dụng. Vào mục Thông tin ứng dụng -> Quyền ứng dụng -> Quyền máy ảnh -> cho phép';

  @override
  String get dongY => 'Đồng ý';

  @override
  String get tuChoi => 'Từ chối';

  @override
  String get zzz => '';
}
