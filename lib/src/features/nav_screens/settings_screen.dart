import 'dart:io';
import 'package:galleryapp/src/features/home_screen.dart';
import 'package:url_launcher/url_launcher.dart' as UL;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galleryapp/src/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  showRateUsDialog() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return RatingDialog(
          showCloseButton: false,
          commentHint: 'Your Feedback!',
          title: Text('How would you rate app?',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: Utils.mediumTextSize,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              )),
          image: const Icon(
            Icons.rate_review,
            color: Colors.black,
            size: 50,
          ),
          submitButtonText: 'SUBMIT',
          submitButtonTextStyle: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: Utils.smallTextSize,
            color: Colors.red,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
          onSubmitted: (response) {
            print(
                'The response: ${response.rating} \n and comment ${response.comment}');
            if (response.rating < 3) {
              //send their comments to your emails
              // ask the user to contact you instead of leaving a bad review
            } else {
              StoreRedirect.redirect(
                  androidAppId: 'com.example.galleryapp',
                  iOSAppId: 'com.example.galleryapp');
            }
          },
          starColor: Colors.red,
          onCancelled: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text('Settings',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: Utils.mediumTextSize,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              )),
        ),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage('assets/images/car4.jpg'),
                    fit: BoxFit.cover)),
            child: Container(),
          ),
          Column(
            children: [
              ListTile(
                onTap: () {
                  Get.to(()=> const HomeScreen());
                },
                title: const Text(
                  'Home',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/home.svg',
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/home.svg',
                        color: Colors.red,
                      ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                leading: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/dark_or_light.svg',
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/dark_or_light.svg',
                        color: Colors.red,
                      ),
                title: Text(
                  Get.isDarkMode ? 'Light Mode' : 'Dark Mode',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    Get.changeThemeMode(
                        Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                    Get.back();
                  },
                  icon:
                      Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.back();
                },
                title: const Text('Privacy Policy',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/privacy.svg',
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/privacy.svg',
                        color: Colors.red,
                      ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                  Get.back();
                  showRateUsDialog();
                },
                title: const Text('Rate Us',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/rate_us.svg',
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/rate_us.svg',
                        color: Colors.red,
                      ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                  final Uri params = Uri(
                    scheme: 'mailto',
                    path: 'wallpaper-pro@gmail.com',
                    query: 'subject=emails&body}',
                  );
                  final url = params.toString();
                  final urlPath = Uri.parse(url);
                  launchUrl(urlPath);
                },
                title: const Text('Feedback',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/feedback.svg',
                        color: Colors.white,
                        height: 20,
                      )
                    : SvgPicture.asset(
                        'assets/icons/feedback.svg',
                        color: Colors.red,
                        height: 22,
                      ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                  Get.back();
                  Share.share('com.example.galleryapp');
                },
                title: const Text('Share with friends',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/share.svg',
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/share.svg',
                        color: Colors.red,
                      ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                  Get.back();
                },
                title: const Text('Update',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/update.svg',
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/update.svg',
                        color: Colors.red,
                      ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                  // const AboutListTile(
                  //   applicationName: 'Happy Wall',
                  //   applicationVersion: '1.0',
                  //   applicationLegalese: 'SoftLeads.com',
                  //   child: Text('About App',
                  //       style: TextStyle(fontWeight: FontWeight.bold)),
                  // );
                  Get.back();
                },
                title: const Text('About App',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/info.svg',
                        color: Colors.white,
                        height: 22,
                      )
                    : SvgPicture.asset(
                        'assets/icons/info.svg',
                        color: Colors.red,
                        height: 22,
                      ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () => exit(0),
                title: const Text('Exit',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/exit.svg',
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/exit.svg',
                        color: Colors.red,
                      ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                  print('Remove ads clicked');
                },
                title: const Text('Remove Ads',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/remove_ad.svg',
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/remove_ad.svg',
                        color: Colors.red,
                      ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              const Divider(),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Version 1.0',
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}