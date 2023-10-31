import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/controller/favorite_controller.dart';
import '../utils/config.dart';
import '../ImageViewScreen/imageview_screen.dart';

// ignore: must_be_immutable
class CategoryDetailScreen extends StatefulWidget {
  String name;
  String title;
  String descriptions;
  List image;

  CategoryDetailScreen({
    super.key,
    required this.name,
    required this.title,
    required this.descriptions,
    required this.image,
  });

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios)),
          titleSpacing: -20.0,
          elevation: 0,
          title: ListTile(
            title: Get.isDarkMode
                ? Text(
                    widget.name,
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: AppConfig.mediumTextSize,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                : Text(
                    widget.name,
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: AppConfig.mediumTextSize,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
            subtitle: Text(
              '${widget.image.length} Wallpaper Available',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: AppConfig.smallTextSize,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MasonryGridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: widget.image.length,
                  scrollDirection: Axis.vertical,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final data = widget.image[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ImageViewScreen(
                              getImage: data['image'],
                              title: widget.title,
                              descriptions: widget.descriptions),
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            child: Image.network(
                              widget.image[index]['image'],
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
      ),
    );
  }
}
