import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:galleryapp/src/utils/utils.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends StatefulWidget {
  ImageProvider? image;

  FavoriteScreen({super.key, this.image});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          title:  Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text('Favorite',style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: Utils.mediumTextSize,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
            )),
          ),
          backgroundColor: Colors.black.withOpacity(0.5),
        ),
        body: const Center(
          child: Text('Favorite',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
        ));
  }
}
