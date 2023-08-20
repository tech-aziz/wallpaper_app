
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';


class FavoriteScreen extends StatefulWidget {
  ImageProvider ? image;

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              child: Image.asset(
                widget.image.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
