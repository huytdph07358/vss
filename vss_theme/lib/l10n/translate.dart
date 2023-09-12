import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'translate_en.dart';
import 'translate_vi.dart';

/// Callers can lookup localized strings with an instance of Translate
/// returned by `Translate.of(context)`.
///
/// Applications need to include `Translate.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/translate.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Translate.localizationsDelegates,
///   supportedLocales: Translate.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Translate.supportedLocales
/// property.
abstract class Translate {
  Translate(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Translate of(BuildContext context) {
    return Localizations.of<Translate>(context, Translate)!;
  }

  static const LocalizationsDelegate<Translate> delegate = _TranslateDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @mauCham.
  ///
  /// In en, this message translates to:
  /// **'Indigo'**
  String get mauCham;

  /// No description provided for @mauDaCam.
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get mauDaCam;

  /// No description provided for @mauDo.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get mauDo;

  /// No description provided for @mauHoPhach.
  ///
  /// In en, this message translates to:
  /// **'Amber'**
  String get mauHoPhach;

  /// No description provided for @mauHong.
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get mauHong;

  /// No description provided for @mauNau.
  ///
  /// In en, this message translates to:
  /// **'Brown'**
  String get mauNau;

  /// No description provided for @mauSac.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get mauSac;

  /// No description provided for @mauTim.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get mauTim;

  /// No description provided for @mauVang.
  ///
  /// In en, this message translates to:
  /// **'Yellow'**
  String get mauVang;

  /// No description provided for @mauVoChanh.
  ///
  /// In en, this message translates to:
  /// **'Lime'**
  String get mauVoChanh;

  /// No description provided for @mauXam.
  ///
  /// In en, this message translates to:
  /// **'Grey'**
  String get mauXam;

  /// No description provided for @mauXanhDaTroi.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get mauXanhDaTroi;

  /// No description provided for @mauXanhLaCay.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get mauXanhLaCay;

  /// No description provided for @mauXanhLam.
  ///
  /// In en, this message translates to:
  /// **'Teal'**
  String get mauXanhLam;

  /// No description provided for @mauXanhLo.
  ///
  /// In en, this message translates to:
  /// **'Cyan'**
  String get mauXanhLo;

  /// No description provided for @zzz.
  ///
  /// In en, this message translates to:
  /// **''**
  String get zzz;
}

class _TranslateDelegate extends LocalizationsDelegate<Translate> {
  const _TranslateDelegate();

  @override
  Future<Translate> load(Locale locale) {
    return SynchronousFuture<Translate>(lookupTranslate(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_TranslateDelegate old) => false;
}

Translate lookupTranslate(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return TranslateEn();
    case 'vi': return TranslateVi();
  }

  throw FlutterError(
    'Translate.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
