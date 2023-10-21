import 'dart:io';
import 'package:galleryapp/src/features/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galleryapp/src/utils/styles.dart';
import 'package:galleryapp/src/utils/utils.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';
import 'package:slide_rating_dialog/slide_rating_dialog.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final width = Get.width;
  final height = Get.height;

  // showRateUsDialog() {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (context) {
  //       return RatingDialog(
  //         initialRating: 1.0,
  //         showCloseButton: false,
  //         image: Get.isDarkMode
  //             ? SvgPicture.asset(
  //                 'assets/icons/happy.svg',
  //                 color: Colors.white,
  //                 width: Get.width * .2,
  //                 height: Get.height * .1,
  //               )
  //             : SvgPicture.asset(
  //                 'assets/icons/happy.svg',
  //                 color: Colors.red,
  //                 width: Get.width * .2,
  //                 height: Get.height * .1,
  //               ),
  //         title: Get.isDarkMode
  //             ? Text(
  //                 'We are working hard for a better user experience.\n We\'d greatly appreciate if you can\n rate us.',
  //                 style: GoogleFonts.lato(
  //                   textStyle: Theme.of(context).textTheme.displayLarge,
  //                   fontSize: 19,
  //                   color: Colors.white,
  //                   fontWeight: FontWeight.w900,
  //                   fontStyle: FontStyle.italic,
  //                 ),
  //                 textAlign: TextAlign.center)
  //             : Text(
  //                 'We are working hard for a better user experience.\n We\'d greatly appreciate if you can\n rate us.',
  //                 style: GoogleFonts.lato(
  //                   textStyle: Theme.of(context).textTheme.displayLarge,
  //                   fontSize: 19,
  //                   color: Colors.black.withOpacity(0.8),
  //                   fontWeight: FontWeight.w900,
  //                   fontStyle: FontStyle.italic,
  //                 ),
  //                 textAlign: TextAlign.center),
  //         message: const Text(
  //           'The best we can get:)',
  //           textAlign: TextAlign.center,
  //         ),
  //         submitButtonText: 'SUBMIT',
  //         submitButtonTextStyle: GoogleFonts.lato(
  //           textStyle: Theme.of(context).textTheme.displayLarge,
  //           fontSize: Utils.smallTextSize,
  //           color: Colors.red,
  //           fontWeight: FontWeight.w900,
  //           fontStyle: FontStyle.italic,
  //         ),
  //         onSubmitted: (response) {
  //           print(
  //               'The response: ${response.rating} \n and comment ${response.comment}');
  //           if (response.rating < 3) {
  //             //send their comments to your emails
  //             // ask the user to contact you instead of leaving a bad review
  //           } else {
  //             StoreRedirect.redirect(
  //                 androidAppId: 'com.example.galleryapp',
  //                 iOSAppId: 'com.example.galleryapp');
  //           }
  //         },
  //         starColor: Colors.red,
  //         onCancelled: () {},
  //       );
  //     },
  //   );
  // }

  showRateUsDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext cont) => SlideRatingDialog(
              title: 'Rate Us!',
              subTitle: "How was your experience with us?",
              buttonColor: Get.isDarkMode ? Colors.red : Colors.blue,
              onRatingChanged: (rating) {
                print(rating.toString());
              },
              cancelButton: true,
              buttonOnTap: () {
                // Do your Business Logic here;
                print('Submit is click');
                Get.back();
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text('Settings', style: Style.bottomNavBarTextStyle(context)),
        ),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          InkWell(
            onTap: () => Get.snackbar('title', 'message'),
            child: Container(
              height: MediaQuery.sizeOf(context).height * .2,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1516339901601-2e1b62dc0c45?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=671&q=80'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25)),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: Get.isDarkMode
                              ? SvgPicture.asset(
                                  'assets/icons/remove_ad.svg',
                                  color: Colors.white,
                                )
                              : SvgPicture.asset(
                                  'assets/icons/remove_ad.svg',
                                  color: Colors.red,
                                ),
                          label: Get.isDarkMode
                              ? const Text(
                                  'Go Premium',
                                  style: TextStyle(color: Colors.white),
                                )
                              : const Text(
                                  'Go Premium',
                                  style: TextStyle(color: Colors.black),
                                )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              ListTile(
                onTap: () {
                  Get.offAll(() => const MainScreen());
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
                    query: 'Happy Wall Feedback',
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
              Get.isDarkMode
                  ? const Divider(
                      indent: 20,
                      thickness: 0.4,
                      endIndent: 20,
                      color: Colors.white,
                    )
                  : const Divider(
                      indent: 20,
                      thickness: 0.4,
                      endIndent: 20,
                    ),
              const SizedBox(
                height: 10,
              ),
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
