import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/OnbordingScreen/onbording_screen.dart';
import 'package:wallpaper_app/views/utils/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../utils/config.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // Called only once when the widget is created
  @override
  void initState() {
    Timer( const Duration(seconds: 2), () {
      Get.off(()=> const OnBoardingScreen(),);
    });
    super.initState();
  }

  // Builds the widget tree
  // A build is triggered every time we use setState()
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.bgColorDarkTheme,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              Lottie.asset(
                animate: true,
                'assets/lottie/splash_animation1.json',
                width: size.width,
              ),
               Text(
                 AppConfig.appName,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 32,
                  letterSpacing: 1,
                  color: Colors.red,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
