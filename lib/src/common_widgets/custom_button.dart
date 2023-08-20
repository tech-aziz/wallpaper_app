import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customButton(String btnName){
  return Container(
    height: 50,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.black12.withOpacity(0.1),
      borderRadius: BorderRadius.circular(25),
    ),
    child: Center(
      child: Text(
        btnName,
        style: GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      ),),
    ),
  );
}