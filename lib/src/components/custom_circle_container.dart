import 'package:flutter/material.dart';

Widget customCircleContainer({IconData? icon}) {
  return Container(
    alignment: Alignment.center,
    // padding: const EdgeInsets.all(15.0),
    decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
        border: Border.all(color: Colors.white.withOpacity(.15), width: 2),
        shape: BoxShape.circle),
    child: Center(child: Icon(icon,)),
  );
}
