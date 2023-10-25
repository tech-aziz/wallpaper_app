
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class CustomActionBar extends StatefulWidget {
  final ConfettiController controller;
  const CustomActionBar({super.key, required this.controller});

  @override
  State<CustomActionBar> createState() => _CustomActionBarState();
}

class _CustomActionBarState extends State<CustomActionBar> {

  bool isPlaying = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: WillPopScope(
                  onWillPop: () async {
                    widget.controller.stop();
                    return true;
                  },
                  child: AlertDialog(
                    insetPadding: EdgeInsets.zero,
                    contentPadding: EdgeInsets.zero,
                    backgroundColor: Colors.black.withOpacity(.001),
                    elevation: 0,
                    title: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          InkWell(
                            onTap: () {
                              Get.back();
                              widget.controller.stop();
                            },
                            child: CircleAvatar(
                                radius: 25.0,
                                backgroundColor:
                                Colors.white.withOpacity(.1),
                                child: const Icon(Icons.close)),
                          )
                        ],
                      ),
                    ),
                    content: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOut,
                                  width: size.width,
                                  height: size.height / 2,
                                  // Adjust the height as needed
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                    BorderRadius.circular(12),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Ad will be show here.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
          widget.controller.play();
        },
        child: Lottie.asset(
          height: 35,
          width: 35,
          animate: true,
          'assets/json/ad_animation.json',
        ),
      ),
    );
  }
}
