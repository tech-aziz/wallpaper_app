import 'package:flutter/material.dart';

Widget customButton(
    {required String btnName,
      required Color borderColor,
      Color? textColor,
      required BuildContext context}) {
  return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          // color: Colors.white,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        // decoration: BoxDecoration(
        //     borderRadius: const BorderRadius.all(Radius.circular(12)),
        //     border: Border.all(width: 1, color: borderColor)
        //
        // ),
        child: Center(
            child: Text(
              btnName,
              style:  TextStyle(
                  fontSize: 15,
                  color: textColor,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.9),
            )),
      ));
}
