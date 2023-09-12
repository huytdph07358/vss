import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class LanguageStore {
  static const String defaultLanguage = 'vi';

  static List<LanguageDataModel> languageList() {
    return <LanguageDataModel>[
      LanguageDataModel(
          id: 1,
          name: 'Tiếng Việt',
          languageCode: 'vi',
          fullLanguageCode: 'vi-VN',
          flag: 'assets/images/flag/vi.png'),
      LanguageDataModel(
          id: 2,
          name: 'English',
          languageCode: 'en',
          fullLanguageCode: 'en-US',
          flag: 'assets/images/flag/en.png'),
    ];
  }

  static String getLanguageName(String languageCode) {
    LanguageDataModel language = languageList()
        .firstWhere((element) => element.languageCode == languageCode);
    return language.name ?? "";
  }

  static String selectedLanguageCode = defaultLanguage;
  static Locale localeSelected = const Locale(defaultLanguage);
  static void Function(int value)? handleLocaleChange;

  static Future<void> initializeLanguage() async {
    selectedLanguageCode =
        getStringAsync(SELECTED_LANGUAGE_CODE, defaultValue: defaultLanguage);
    if (selectedLanguageCode == '') {
      selectedLanguageCode = defaultLanguage;
    }
    localeSelected = Locale(selectedLanguageCode);
    selectedLanguageDataModel = getSelectedLanguageModel();
  }

  static Future<void> setLanguage(Locale locale) async {
    selectedLanguageCode = locale.languageCode;
    localeSelected = locale;
    await setValue(SELECTED_LANGUAGE_CODE, selectedLanguageCode);
    selectedLanguageDataModel = getSelectedLanguageModel();
  }
}
