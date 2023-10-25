import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/utils/colors.dart';
import 'package:wallpaper_app/views/utils/config.dart';
import 'package:google_fonts/google_fonts.dart';

final lightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    elevatedButtonTheme: elevatedButtonThemeData);

final elevatedButtonThemeData = ElevatedButtonThemeData(
  style: TextButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      padding:   EdgeInsets.all(AppConfig.defaultPadding),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConfig.defaultBorderRadius))),
);

final darkThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme));

// class ThemeScreen {
//   static bool mode = false;
//   static IconData lightMode = Icons.wb_sunny;
//   static IconData darkMode = Icons.nights_stay;
//   // static ThemeData lightTheme = ThemeData.light();
//   // static ThemeData darkTheme = ThemeData.dark();
//
//   static ThemeData lightTheme =
//       ThemeData(
//         brightness: Brightness.light,
//         primaryColor: ,
//
//       );
//
//
//   static ThemeData darkTheme =
//       ThemeData(
//           brightness: Brightness.dark,
//           primarySwatch: Colors.yellow,
//           appBarTheme: const AppBarTheme(backgroundColor: Colors.yellow));
// }
