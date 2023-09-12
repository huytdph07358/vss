import 'translate.dart';

/// The translations for Vietnamese (`vi`).
class TranslateVi extends Translate {
  TranslateVi([String locale = 'vi']) : super(locale);

  @override
  String get xuLyThanhCong => 'Xử lý thành công';

  @override
  String get xuLyThatBai => 'Xử lý thất bại';

  @override
  String get thongBao => 'Thông báo';

  @override
  String get zzz => '';
}
