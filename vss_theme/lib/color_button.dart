import 'package:flutter/material.dart';
import 'package:vss_locale/language_store.dart';

import 'color_enum.dart';
import 'l10n/translate.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({
    super.key,
    required this.handleColorSelect,
    required this.colorSelected,
  });

  final void Function(int) handleColorSelect;
  final ColorEnum colorSelected;

  @override
  Widget build(BuildContext context) {
    final Translate translate = lookupTranslate(LanguageStore.localeSelected);

    final Map<String, String> mapColor = <String, String>{};
    mapColor['Indigo'] = translate.mauCham;
    mapColor['Blue'] = translate.mauXanhDaTroi;
    mapColor['Teal'] = translate.mauXanhLam;
    mapColor['Green'] = translate.mauXanhLaCay;
    mapColor['Yellow'] = translate.mauVang;
    mapColor['Orange'] = translate.mauDaCam;
    mapColor['Pink'] = translate.mauHong;
    mapColor['Grey'] = translate.mauXam;
    mapColor['Amber'] = translate.mauHoPhach;
    mapColor['Brown'] = translate.mauNau;
    mapColor['Cyan'] = translate.mauXanhLo;
    mapColor['Purple'] = translate.mauTim;
    mapColor['Red'] = translate.mauDo;
    mapColor['Lime'] = translate.mauVoChanh;

    return PopupMenuButton(
      icon: Icon(
        Icons.palette_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (BuildContext context) {
        return List.generate(ColorEnum.values.length, (int index) {
          final ColorEnum colorSeed = ColorEnum.values[index];
          return PopupMenuItem(
            value: index,
            enabled: colorSeed != colorSelected,
            child: Row(
              children: <Widget>[
                Text(
                  mapColor[colorSeed.label]!,
                  style: TextStyle(color: colorSeed.color),
                ),
                Icon(
                  colorSeed == colorSelected
                      ? Icons.color_lens
                      : Icons.color_lens_outlined,
                  color: colorSeed.color,
                ),
              ],
            ),
          );
        });
      },
      onSelected: handleColorSelect,
    );
  }
}
