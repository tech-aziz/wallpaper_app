import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/utils.dart';
import 'main_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.shade700,
                  blurRadius: 5,
                  offset: const Offset(0, 7),
                ),
              ],
              image: const DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1505118380757-91f5f5632de0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2126&q=80'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.white
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0, .01, 1],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Explore 4k \nWallpapers',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 42,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(
                      height: Utils.defaultPadding / 2,
                    ),
                    Text(
                      'Explore, Create, Share\n Ultra 4k wallpapers Now!',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: Utils.mediumTextSize,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: Utils.defaultPadding,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(Utils.defaultPadding / 2),
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25), // Button border radius
                              ),
                              textStyle: const TextStyle(
                                fontSize: 16, // Text size
                                fontWeight: FontWeight.bold, // Text weight
                              ),
                            ),
                            onPressed: () {
                              Get.off(() => const MainScreen(),
                                  transition: Transition.rightToLeft,
                                  duration: const  Duration(seconds: 1));
                            },
                            child: const Text('Get Started')),
                      ),
                    ),
                    const SizedBox(
                      height: Utils.defaultPadding / 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
