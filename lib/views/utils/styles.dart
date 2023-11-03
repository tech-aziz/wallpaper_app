import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/utils/config.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {

  static OutlineInputBorder inputBorder() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none);
  }

  static TextStyle globalTextStyle(
      {double? fontSize,
      double? wordSpacing,
      Color? color,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      double? letterSpacing,
      TextStyle? textStyle,
      List<Shadow>? shadows}) {
    return GoogleFonts.lato(
        fontSize: fontSize,
        color: color,
        wordSpacing: wordSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        textStyle: textStyle,
        shadows: shadows);
  }
}
