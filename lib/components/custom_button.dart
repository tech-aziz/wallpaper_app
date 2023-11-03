import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/utils/config.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/utils/styles.dart';

Widget customButton({required String btnName, required Color borderColor,  Color ? textColor,  required BuildContext context}) {
  return Padding(
    padding:  EdgeInsets.all(AppConfig.defaultPadding / 2),
    child: Container(
      height: 50,
      width: double.infinity,
      decoration:  BoxDecoration(
        borderRadius:   BorderRadius.all(Radius.circular(AppConfig.defaultBorderRadius)),
        border: Border.all(width: 1, color: borderColor)
      ),
      child: Center(child: Text(btnName,
        style: Style.globalTextStyle(
            fontSize: 20,
            color: Colors.black,
            fontStyle: FontStyle.italic,
            letterSpacing: 0.9)
        ,)),
    )
  );
}
