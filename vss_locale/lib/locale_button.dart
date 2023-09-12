import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'language_store.dart';

class LocaleButton extends StatelessWidget {
  const LocaleButton({
    super.key,
    required this.handleLocaleSelect,
    required this.localeSelected,
  });

  final void Function(int) handleLocaleSelect;
  final Locale localeSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.language_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (BuildContext context) {
        return List.generate(LanguageStore.languageList().length, (int index) {
          final Locale currentLocale =
              Locale(LanguageStore.languageList()[index].languageCode!);
          final LanguageDataModel languageDataModel =
              LanguageStore.languageList()[index];
          return PopupMenuItem(
            value: index,
            enabled: currentLocale != localeSelected,
            child: Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      Text(
                        languageDataModel.name!,
                      ),
                      Image.asset(
                        languageDataModel.flag!,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
      onSelected: handleLocaleSelect,
    );
  }
}
