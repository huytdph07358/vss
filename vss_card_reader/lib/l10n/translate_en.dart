import 'translate.dart';

/// The translations for English (`en`).
class TranslateEn extends Translate {
  TranslateEn([String locale = 'en']) : super(locale);

  @override
  String get docThe => 'Card reader';

  @override
  String get tapThe => 'Tap card';

  @override
  String get quetQrcode => 'Scan qrocde';

  @override
  String get boQua => 'Cancel';

  @override
  String get dongY => 'Agree';

  @override
  String get dangXuLy => 'Processing...';

  @override
  String get duLieuBatBuoc => 'Require data';

  @override
  String get tiepTuc => 'Next';

  @override
  String get xuLyThanhCong => 'Process success';

  @override
  String get xuLyThatBai => 'Process fail';

  @override
  String get vuiLongDienDayDuThongTinDeTiepTuc => 'Please enter all information to continue';

  @override
  String get khongDocDuocKeyHeThong => 'Can\'t read system key';

  @override
  String get khongDocDuocDuLieuTrenThe => 'Can\'t read data on card';

  @override
  String get thietLapNfcChuaBat => 'nfc setup is not enabled';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get kiemTraLienTuc => 'Continuity check';

  @override
  String get iosAlertMessage => 'Hold your iPhone near the card';

  @override
  String get iosMultipleTagMessage => 'More than one tags are detected, please leave only one tag and try again.';

  @override
  String get zzz => '';
}
