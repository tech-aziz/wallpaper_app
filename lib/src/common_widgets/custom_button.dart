import 'package:flutter/material.dart';
import 'package:galleryapp/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customButton({required String btnName, required Color borderColor,  Color ? textColor,  required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.all(Utils.defaultPadding / 2),
    child: Container(
      height: 50,
      width: 100,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(Utils.defaultBorderRadius)),
        border: Border.all(width: 1, color: borderColor)
      ),
      child: Center(child: Text(btnName,style: GoogleFonts.lato(
        textStyle: Theme.of(context).textTheme.bodySmall,
        fontSize: Utils.smallTextSize,
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