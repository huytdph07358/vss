import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nb_utils/nb_utils.dart';

import 'color_enum.dart';

class ThemeStore {
  static const nameThemeModeOnPref = 'nameThemeModeOnPref';
  static const defaultLanguage = 'vi';
  static String themeModeName = ThemeMode.system.toString();
  static bool isHover = false;
  static const colorIndexOnPref = 'colorIndexOnPref';
  static void Function(int value)? handleColorSelect;
  static void Function(ThemeData themeData)? handleThemeDataChange;
  static ColorEnum colorSelected = ColorEnum.orange;

  static ThemeMode get getThemeMode {
    if (themeModeName == ThemeMode.system.toString()) {
      return ThemeMode.system;
    } else if (themeModeName == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  static bool get isDarkModeOn {
    if (themeModeName == ThemeMode.system.toString()) {
      return SchedulerBinding.instance.window.platformBrightness ==
          Brightness.dark;
    } else {
      return (themeModeName == ThemeMode.dark.toString());
    }
  }

  static Future<void> changeThemeMode(int index) async {
    ThemeMode themeMode = ThemeMode.values.elementAt(index);
    themeModeName = themeMode.toString();
    setValue(nameThemeModeOnPref, themeModeName);
    if (handleThemeDataChange != null) {
      handleThemeDataChange!(
          getThemeMode == ThemeMode.dark ? getAppDarkTheme() : getAppTheme());
    }
  }

  static Future<void> setThemeColor(int value) async {
    colorSelected = ColorEnum.values[value];
    setValue(colorIndexOnPref, value);
  }

  static Future<void> initializeTheme() async {
    int colorIndex = getIntAsync(colorIndexOnPref, defaultValue: 0);
    colorSelected = ColorEnum.values[colorIndex];
    themeModeName = getStringAsync(nameThemeModeOnPref,
        defaultValue: ThemeMode.system.toString());
  }

  static Color? get appBarColor {
    return ThemeStore.isDarkModeOn ? Colors.black : Colors.white;
  }

  static ThemeData getAppTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      dividerColor: Colors.transparent,
      colorSchemeSeed: colorSelected.color,
      useMaterial3: true,
      brightness: Brightness.light,
    ).copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
          }),
    );
  }

  static ThemeData getAppDarkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: Colors.black,
      dividerColor: Colors.transparent,
      colorSchemeSeed: colorSelected.color,
      useMaterial3: true,
      brightness: Brightness.dark,
    ).copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
          }),
    );
  }

  static late ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    backgroundColor: Colors.transparent,
    colorSchemeSeed: colorSelected.color,
    useMaterial3: true,
    brightness: Brightness.light,
    dividerColor: Colors.transparent,
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
        }),
  );

  static late ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    dividerColor: scaffoldLightColor,
    //fontFamily: GoogleFonts.openSans().fontFamily,
    primaryTextTheme: TextTheme(
        headline6: primaryTextStyle(color: Colors.white),
        overline: primaryTextStyle(color: Colors.white)),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorSchemeSeed: colorSelected.color,
    useMaterial3: true,
    brightness: Brightness.dark,
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
        }),
  );
}
