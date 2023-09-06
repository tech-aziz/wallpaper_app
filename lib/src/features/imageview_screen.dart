import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:galleryapp/src/common_widgets/custom_button.dart';
import 'package:galleryapp/src/common_widgets/custom_dialog_box.dart';
import 'package:galleryapp/src/features/home_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/wallpaper.dart';
import '../utils/utils.dart';
import 'package:flutter/services.dart';

class ImageViewScreen extends StatefulWidget {
  final String getImage;
  String title;
  String descriptions;

  ImageViewScreen(
      {super.key,
      required this.getImage,
      required this.title,
      required this.descriptions});

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  final height = Get.height;
  final width = Get.width;

  double? _progress;
  String home = "Home Screen",
      lock = "Lock Screen",
      both = "Both Screen",
      system = "System";
  //
  // void _setWallpaper(String imageUrl, int wallpaperType) async {
  //   try {
  //     var result = await WallpaperManager.setWallpaper(
  //       imageUrl,
  //       wallpaperType: wallpaperType,
  //     );
  //
  //     if (result) {
  //       // Wallpaper set successfully
  //       print('Wallpaper set successfully');
  //     } else {
  //       // Wallpaper couldn't be set
  //       print('Failed to set wallpaper');
  //     }
  //   } catch (e) {
  //     // Handle any errors that might occur
  //     print('Error: $e');
  //   }
  // }

  @override
  void initState() {
    // for hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }

  @override
  void dispose() {
    // for dispose status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.dispose();
  }
  //
  // applyWallpaper(String? image, String? location, String? path) {}

  @override
  Widget build(BuildContext context) {
    print(' Image is: ${widget.getImage}');
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    leading: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.1),
                            border: Border.all(
                                color: Colors.white.withOpacity(.15), width: 1),
                            shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.getImage,
                      ),
                      fit: BoxFit.cover)),
            ),
            // const Spacer(),
            // Positioned(child: ),
            Positioned(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialogBox(
                                title: widget.title,
                                descriptions: widget.descriptions,
                                img: widget.getImage);
                          },
                        );

                        print('info is clicked');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.red),
                                // borderRadius: BorderRadius.circular(12),
                                color: Colors.white10.withOpacity(0.1),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SvgPicture.asset(
                                'assets/icons/info.svg',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Info',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    _progress != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              const CircularProgressIndicator(
                                color: Colors.red,
                              ),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      shape: BoxShape.circle,
                                      color: Colors.white10.withOpacity(0.1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/save.svg',
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Save',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : InkWell(
                            onTap: () {
                              print('Save is clicked');
                              FileDownloader.downloadFile(
                                url: widget.getImage.toString(),
                                onProgress: (fileName, progress) {
                                  setState(() {
                                    _progress = progress;
                                  });
                                },
                                onDownloadCompleted: (value) {
                                  print(' The value is: ${value}');
                                  setState(() {
                                    Get.snackbar(
                                        borderRadius: Utils.defaultBorderRadius,
                                        duration: const Duration(seconds: 3),
                                        isDismissible: true,
                                        dismissDirection:
                                            DismissDirection.vertical,
                                        forwardAnimationCurve:
                                            Curves.easeOutBack,
                                        snackPosition: SnackPosition.TOP,
                                        colorText: Colors.white,
                                        backgroundColor: Colors.red,
                                        'Congratulations',
                                        'Download successfully!');
                                    _progress = null;
                                  });
                                },
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 1, color: Colors.red),
                                    shape: BoxShape.circle,
                                    color: Colors.white10.withOpacity(0.1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: SvgPicture.asset(
                                      'assets/icons/save.svg',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Save',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  topLeft: Radius.circular(12))),
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 290,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text('Apply',
                                      style: GoogleFonts.lato(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        fontSize: Utils.smallTextSize,
                                        color: Colors.black.withOpacity(0.5),
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      )),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      home = await Wallpaper.homeScreen(
                                          options: RequestSizeOptions.RESIZE_FIT,
                                          width: width,
                                          height: height);
                                      setState(() {
                                        home = home;
                                      });
                                      print("Task Done");
                                      Get.off(() => const HomeScreen());
                                      print('home screen It clicked');
                                    },
                                    child: customButton(
                                        btnName: 'Home Screen',
                                        textColor: Colors.black,
                                        borderColor: Colors.red,
                                        context: context),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      print('lock screen It clicked');
                                    },
                                    child: customButton(
                                        btnName: 'Lock Screen',
                                        textColor: Colors.black,
                                        borderColor: Colors.red,
                                        context: context),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      print('Both screen It clicked');
                                    },
                                    child: customButton(
                                        btnName: 'Both',
                                        textColor: Colors.black,
                                        borderColor: Colors.red,
                                        context: context),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                        print('Apply is clicked');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SvgPicture.asset(
                                'assets/icons/apply.svg',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Apply',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
