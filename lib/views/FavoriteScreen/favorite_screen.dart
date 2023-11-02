import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper_app/views/utils/styles.dart';

import '../ImageViewScreen/imageview_screen.dart';

// ignore: must_be_immutable
class FavoriteScreen extends StatefulWidget {
  ImageProvider? image;

  FavoriteScreen({super.key, this.image});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // final FavoriteController favoriteController = Get.find();

  List<Map> favImages = [];

  getImages() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('favImages');
    if (data != null) {
      List<Map> imageList = List<Map>.from(jsonDecode(data));
      setState(() {
        favImages = imageList;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    print('The image is $favImages');
    print('Image length ${favImages.length}');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text('Favorite', style: Style.bottomNavBarTextStyle(context)),
        ),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: MasonryGridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: favImages.length,
                scrollDirection: Axis.vertical,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final data = favImages[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ImageViewScreen(
                          getImage: data['url'],
                          title: data['title'],
                          descriptions: data['description'],
                        ),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          child: Image.network(data['url'],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
