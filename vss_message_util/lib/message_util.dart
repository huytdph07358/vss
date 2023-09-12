import 'package:flutter/material.dart';
import 'package:vss_locale/language_store.dart';

import 'l10n/translate.dart';

class MessageUtil {
  static void snackbar(BuildContext context, {String? message, bool? success}) {
    final Translate translate = lookupTranslate(LanguageStore.localeSelected);
    String? content;
    Color backgroundColor;

    if (message != null && message != '') {
      content = message;
    } else {
      if (success ?? false) {
        content = translate.xuLyThanhCong;
      } else if (success == false) {
        content = translate.xuLyThatBai;
      }
    }
    if (success ?? false) {
      backgroundColor = Theme.of(context).colorScheme.primary;
    } else if (success == false) {
      backgroundColor = Theme.of(context).colorScheme.error;
    } else {
      backgroundColor = Theme.of(context).colorScheme.onBackground;
    }

    if (content != null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(content),
        backgroundColor: backgroundColor,
      ));
    }
  }
}
