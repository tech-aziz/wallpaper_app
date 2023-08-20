import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class ImageViewScreen extends StatefulWidget {
  final String getImage;

  const ImageViewScreen({super.key, required this.getImage});

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  double? _progress;

  @override
  Widget build(BuildContext context) {
    print(' Image is: ${widget.getImage}');
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white10.withOpacity(0.1),
                            ),
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
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.red,
                          ))
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
                                    borderRadius: BorderRadius.circular(12),
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
                        print('Apply is clicked');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.red),
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
