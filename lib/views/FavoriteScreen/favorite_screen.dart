import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/utils/styles.dart';

// ignore: must_be_immutable
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
            child: Text('Favorite',style: Style.bottomNavBarTextStyle(context)),
          ),
          backgroundColor: Colors.black.withOpacity(0.5),
        ),
        body: const Center(
          child: Text('No favorite yet..',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
        ));
  }
}
