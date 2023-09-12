import 'translate.dart';

/// The translations for English (`en`).
class TranslateEn extends Translate {
  TranslateEn([String locale = 'en']) : super(locale);

  @override
  String get xuLyThanhCong => 'Process success';

  @override
  String get xuLyThatBai => 'Process fail';

  @override
  String get thongBao => 'Notify';

  @override
  String get zzz => '';
}
