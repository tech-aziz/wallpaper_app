import 'package:flutter/material.dart';
import 'package:galleryapp/src/constants/colors.dart';
import 'package:galleryapp/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

final lightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    elevatedButtonTheme: elevatedButtonThemeData);

final elevatedButtonThemeData = ElevatedButtonThemeData(
  style: TextButton.styleFrom(
      backgroundColor: primaryColor,
      padding: const EdgeInsets.all(Utils.defaultPadding),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Utils.defaultBorderRadius))),
);

final darkThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
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
