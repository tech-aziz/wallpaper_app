import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/utils/config.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: Center(child: Text(btnName,style: GoogleFonts.lato(
        textStyle: Theme.of(context).textTheme.bodySmall,
        fontSize: AppConfig.smallTextSize,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),)),
    )
  );
}


// SizedBox(
// height: 50,
// width: double.infinity,
// child: ElevatedButton(
// style: ElevatedButton.styleFrom(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(25), // Button border radius
// ),
// textStyle: const TextStyle(
// fontSize: 16, // Text size
// fontWeight: FontWeight.bold, // Text weight
// ),
// ),
// onPressed: () {},
// child: Text(btnName)),
// ),