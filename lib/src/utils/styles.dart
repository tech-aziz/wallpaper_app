
import 'package:flutter/material.dart';
import 'package:galleryapp/src/utils/utils.dart';

class Style{

  static TextStyle navBarText() {
    return const TextStyle(
        fontSize: Utils.largeTextSize,
        color: Colors.black,
        fontWeight: FontWeight.bold
    );
  }

  static OutlineInputBorder inputBorder() { //return type is OutlineInputBorder
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none
    );
  }




}