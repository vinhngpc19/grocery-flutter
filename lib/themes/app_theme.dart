import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/themes/text_theme.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xfff2f2f2);
  static Color lightPrimaryColor = const Color.fromARGB(255, 226, 27, 34);
  static Color lightSecondaryColor = const Color(0xff040415);
  static Color lightAccentColor = Colors.blueGrey.shade200;
  static Color lightParticlesColor = const Color(0x44948282);
  static Color lightTextColor = Colors.black54;
  static Color grey = const Color.fromARGB(255, 239, 239, 239);
  static Color greyIcon = const Color(0xff868686);

  const AppTheme._();

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: lightPrimaryColor,
      primaryColorLight: Colors.blue,
      primaryColorDark: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(backgroundColor: lightPrimaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: MyTextStyle.textStyle(style: const TextStyle()),
          unselectedLabelStyle:
              MyTextStyle.textStyle(style: const TextStyle())),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: lightBackgroundColor)),
      colorScheme: ColorScheme.light(secondary: lightSecondaryColor)
          .copyWith(background: Colors.red));

  static Brightness get currentSystemBrightness =>
      // ignore: deprecated_member_use
      SchedulerBinding.instance.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: lightBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}
