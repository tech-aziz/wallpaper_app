import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/MainScreen/main_screen.dart';
import 'package:wallpaper_app/views/utils/config.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
                     SizedBox(
                       height: AppConfig.defaultPadding / 2,
                    ),

                    Text(
                      'Explore, Create, Share\n Ultra 4k wallpapers Now!',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: AppConfig.mediumTextSize,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                     SizedBox(
                      height: AppConfig.defaultPadding,
                    ),
                    Padding(
                      padding:  EdgeInsets.all(AppConfig.defaultPadding / 2),
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
                                  duration: const Duration(seconds: 1));
                            },
                            child: const Text('Get Started')),
                      ),
                    ),
                     SizedBox(
                      height: AppConfig.defaultPadding / 2,
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
