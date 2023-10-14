import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

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
          title: const Text('Favorite'),
          backgroundColor: Colors.green.withOpacity(0.5),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Favorite',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
        ));
  }
}
