import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper_app/views/utils/styles.dart';
import '../ImageViewScreen/imageview_screen.dart';
import '../utils/config.dart';

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

  void getImages() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('favImages');
    if (data != null) {
      List<Map> imageList = List<Map>.from(jsonDecode(data));
      setState(() {
        favImages = imageList;
      });
    }
  }

  deleteImage(index) async {
    setState(() {
      favImages.removeAt(index);
    });
    saveImage(favImages);
  }

  void saveImage(List<Map> favImages) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('favImages', jsonEncode(favImages));
    Get.snackbar(
        borderRadius: AppConfig.defaultBorderRadius,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        'Sorry',
        'Image deleted successfully');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text('Favorite',
              style: Style.globalTextStyle(
                  fontSize: AppConfig.extraLargeTextSize,
                  fontWeight: FontWeight.w900,
                  shadows: [
                    // Shadow(
                    //     color: Colors.black.withOpacity(0.7),
                    //     offset: const Offset(5, 7),
                    //     blurRadius: 1)
                  ],
                  color: Get.isDarkMode ? Colors.white : Colors.black.withOpacity(0.7),
                  fontStyle: FontStyle.italic,
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  letterSpacing: 3)),
        ),
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
                physics: const BouncingScrollPhysics(),
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final data = favImages[index];
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      InkWell(
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
                              child: Image.network(
                                data['url'],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15,
                        top: 15,
                        child: InkWell(
                          onTap: () => deleteImage(index),
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.red,
                                border: Border.all(width: 1, color: Colors.white.withOpacity(0.2)), shape: BoxShape.circle),
                            child: const Center(
                                child: Icon(
                              Icons.delete_outline_rounded,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      )
                    ],
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
