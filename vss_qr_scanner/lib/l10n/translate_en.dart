import 'translate.dart';

/// The translations for English (`en`).
class TranslateEn extends Translate {
  TranslateEn([String locale = 'en']) : super(locale);

  @override
  String get quetMaQr => 'Scan QR code';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get datQrcoeNamVuaKhungHinh_DuSangVaRoNet => 'Place the qrcode to fit the frame, bright enough and clear';

  @override
  String get banCanCapQuyenTruyCapCameraMayChoUngDung => 'You need to grant the app\'s camera access permission';

  @override
  String get khongTruyCapDuocCameraMay => 'Do not access the camera of the device';

  @override
  String get choPhepUngDungTruyCapMayAnhCuaBan => 'Allow app to acess your camera ?';

  @override
  String get banCanChoPhepCapquyenTruyCapMayAnhCuaBanDeSuDungTrongUngDung => 'You need to allow permission to access your camera for use in the app. Go to App Info -> App Permissions -> Camera Permissions -> Allow';

  @override
  String get dongY => 'Allow';

  @override
  String get tuChoi => 'Dont allow';

  @override
  String get zzz => '';
}
