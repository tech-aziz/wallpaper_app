import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/utils/config.dart';
import 'package:google_fonts/google_fonts.dart';

class Style{

  static TextStyle bottomNavBarTextStyle(context) {
    return GoogleFonts.lato(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: AppConfig.mediumTextSize,
      color: Colors.white,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
    );
  }

  static OutlineInputBorder inputBorder() { //return type is OutlineInputBorder
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none
    );
  }




}