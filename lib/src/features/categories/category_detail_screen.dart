import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/favorite_controller.dart';
import '../../utils/utils.dart';
import '../imageview_screen.dart';

class CategoryDetailScreen extends StatefulWidget {
  String name;
  List image;

  CategoryDetailScreen({super.key, required this.name, required this.image});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  // final NavbarController navbarController = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    // print(widget.image.length);
    // FocusManager.instance.primaryFocus?.unfocus();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Get.isDarkMode
                      ? Text(
                          widget.name,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: Utils.largeTextSize,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      : Text(
                          widget.name,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: Utils.largeTextSize,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${widget.image.length} Wallpaper Available',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: Utils.smallTextSize,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // const CustomSearchBar(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: MasonryGridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: widget.image.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final data = widget.image[index];
                    return InkWell(
                      // onDoubleTap: () {
                      //   print('Its clicked double');
                      //   favoriteController.favoriteIncrement();
                      // },
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ImageViewScreen(
                              getImage: widget.image[index]['image']),
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
