import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:galleryapp/src/components/custom_button.dart';
import 'package:galleryapp/src/components/custom_circle_container.dart';
import 'package:galleryapp/src/components/custom_dialog_box.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  String? filePath;

  String state = 'init';

  downloadFile(String type) async {
    FileDownloader.downloadFile(
      url: widget.getImage.toString(),
      onProgress: (fileName, progress) {
        setState(() {
          _progress = progress;
          state = 'downloading';
          print('Progress value $_progress');
        });
      },
      onDownloadCompleted: (value) {
        print(' The value is: $value');

        Get.snackbar(
            borderRadius: Utils.defaultBorderRadius,
            duration: const Duration(seconds: 3),
            isDismissible: true,
            dismissDirection: DismissDirection.vertical,
            forwardAnimationCurve: Curves.easeOutBack,
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.red,
            'Congratulations',
            type == 'set'
                ? 'Wallpaper Successfully Set!'
                : 'Download Successfully!');
        setState(() {
          filePath = value;
          state = 'complete';
          _progress = null;
        });
      },
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.dispose();
  }

  Future<void> _setWallpaper(int locationType) async {
    await downloadFile('set');
    Timer(const Duration(seconds: 3), () async {
      if (state == 'complete') {
        print('I am executed');
        try {
          final result = await WallpaperManager.setWallpaperFromFile(
              filePath!, locationType);
          print('Success $result');
        } catch (e) {
          print('Error is $e');
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    print('State is $state');
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
                      onTap: () => Get.back(),
                      child: customCircleContainer(icon: Icons.arrow_back_ios_new_rounded),
                    ),
                    actions: [
                      InkWell(
                        // onTap: () => Get.back(),
                        child: customCircleContainer(icon: Icons.heart_broken_rounded),
                      )
                    ],
                  ),
                )
              ],
            )),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    widget.getImage,
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                _progress != null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
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
                    InkWell(
                      onTap: () {
                        print('Save is clicked');
                        downloadFile('download');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.red),
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
                            style: TextStyle(fontSize: 20, color: Colors.white),
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
                                      print('home screen It clicked');
                                      Get.back();
                                      _setWallpaper(
                                          WallpaperManager.HOME_SCREEN);
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
                                      Get.back();
                                      print('lock screen It clicked');
                                      _setWallpaper(
                                          WallpaperManager.LOCK_SCREEN);
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
                                      Get.back();
                                      _setWallpaper(
                                          WallpaperManager.BOTH_SCREEN);
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
                )
              ],
            ),
          ),
        ),
        // Stack(
        //   alignment: Alignment.bottomCenter,
        //   children: [
        //     Container(
        //       width: double.infinity,
        //       decoration: BoxDecoration(
        //           image: DecorationImage(
        //               image: NetworkImage(
        //                 widget.getImage,
        //               ),
        //               fit: BoxFit.cover)),
        //     ),
        //     // const Spacer(),
        //     // Positioned(child: ),
        //     Positioned(
        //       child: Padding(
        //         padding:
        //             const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        //         child: ,
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
