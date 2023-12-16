import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/views/MainScreen/main_screen.dart';
import 'package:wallpaper_app/views/utils/styles.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:slide_rating_dialog/slide_rating_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/config.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final width = Get.width;
  final height = Get.height;

  showRateUsDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext cont) => SlideRatingDialog(
              title: 'Rate Us!',
              subTitle: "How was your experience with us?",
              buttonColor: Get.isDarkMode ? Colors.red : Colors.black,
              onRatingChanged: (rating) {},
              cancelButton: false,
              buttonOnTap: () {
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
          child: Text('Settings',
              style: Style.globalTextStyle(
                  fontSize: AppConfig.extraLargeTextSize,
                  fontWeight: FontWeight.w900,
                  shadows: [
                    // Shadow(
                    //     color: Colors.black.withOpacity(0.7),
                    //     offset: const Offset(5, 7),
                    //     blurRadius: 1)
                  ],
                  color: Get.isDarkMode
                      ? Colors.white
                      : Colors.black.withOpacity(0.7),
                  fontStyle: FontStyle.italic,
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  letterSpacing: 3)),
        ),
      ),
      body: ListView(
        children: [
          // InkWell(
          //   onTap: () => Get.snackbar('title', 'message'),
          //   child: Container(
          //     height: MediaQuery.sizeOf(context).height * .2,
          //     width: double.infinity,
          //     decoration: const BoxDecoration(
          //       image: DecorationImage(
          //         image: NetworkImage(
          //             'https://images.unsplash.com/photo-1516339901601-2e1b62dc0c45?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=671&q=80'),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(15.0),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Container(
          //             height: 35,
          //             width: double.infinity,
          //             decoration: BoxDecoration(
          //                 color: Colors.blue,
          //                 borderRadius: BorderRadius.circular(25)),
          //             child: TextButton.icon(
          //                 onPressed: () {},
          //                 icon: Get.isDarkMode
          //                     ? SvgPicture.asset(
          //                         'assets/icons/remove_ad.svg',
          //                         // ignore: deprecated_member_use
          //                         color: Colors.white,
          //                       )
          //                     : SvgPicture.asset(
          //                         'assets/icons/remove_ad.svg',
          //                         // ignore: deprecated_member_use
          //                         color: Colors.red,
          //                       ),
          //                 label: Get.isDarkMode
          //                     ? const Text(
          //                         'Go Premium',
          //                         style: TextStyle(color: Colors.white),
          //                       )
          //                     : const Text(
          //                         'Go Premium',
          //                         style: TextStyle(color: Colors.black),
          //                       )),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Column(
            children: [
              ListTile(
                minLeadingWidth: 20,
                onTap: () {
                  Get.offAll(() => const MainScreen());
                },
                title: const Text(
                  'Home',
                ),
                leading: SvgPicture.asset(
                  'assets/icons/home.svg',
                  // ignore: deprecated_member_use
                  color: Colors.red,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                minLeadingWidth: 20,
                leading: SvgPicture.asset(
                  'assets/icons/dark_or_light.svg',
                  // ignore: deprecated_member_use
                  color: Colors.red,
                ),
                title: Text(
                  Get.isDarkMode ? 'Light Mode' : 'Dark Mode',
                ),
                trailing: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    Get.changeThemeMode(
                        Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                    Get.offAll(() => const MainScreen());
                  },
                  icon:
                      Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
                ),
              ),
              ListTile(
                minLeadingWidth: 20,
                onTap: () {
                  Get.back();
                },
                title: const Text(
                  'Privacy Policy',
                ),
                leading: SvgPicture.asset(
                  'assets/icons/privacy.svg',
                  // ignore: deprecated_member_use
                  color: Colors.red,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                minLeadingWidth: 20,
                onTap: () {
                  Get.back();
                  showRateUsDialog();
                },
                title: const Text(
                  'Rate Us',
                ),
                leading: SvgPicture.asset(
                  'assets/icons/rate_us.svg',
                  // ignore: deprecated_member_use
                  color: Colors.red,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                minLeadingWidth: 20,
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
                title: const Text(
                  'Feedback',
                ),
                leading: SvgPicture.asset(
                  'assets/icons/feedback.svg',
                  // ignore: deprecated_member_use
                  color: Colors.red,
                  height: 20,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                minLeadingWidth: 20,
                onTap: () {
                  Get.back();
                  Share.share('com.example.wallpaper_app');
                },
                title: const Text(
                  'Share with friends',
                ),
                leading: SvgPicture.asset(
                  'assets/icons/share.svg',
                  // ignore: deprecated_member_use
                  color: Colors.red,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                minLeadingWidth: 20,
                onTap: () {
                  Get.back();
                },
                title: const Text(
                  'Update',
                ),
                leading: SvgPicture.asset(
                  'assets/icons/update.svg',
                  // ignore: deprecated_member_use
                  color: Colors.red,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                minLeadingWidth: 20,
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
                title: const Text(
                  'About App',
                ),
                leading: SvgPicture.asset(
                  'assets/icons/info.svg',
                  // ignore: deprecated_member_use
                  color: Colors.red,
                  height: 22,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                minLeadingWidth: 20,
                onTap: () => exit(0),
                title: const Text(
                  'Exit',
                ),
                leading: SvgPicture.asset(
                  'assets/icons/exit.svg',
                  // ignore: deprecated_member_use
                  color: Colors.red,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                minLeadingWidth: 20,
                onTap: () {},
                title: const Text(
                  'Remove Ads',
                ),
                leading: SvgPicture.asset(
                  'assets/icons/remove_ad.svg',
                  // ignore: deprecated_member_use
                  color: Colors.red,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              Get.isDarkMode
                  ? const Divider(
                      indent: 40,
                      thickness: 0.1,
                      endIndent: 40,
                      color: Colors.white,
                    )
                  : const Divider(
                      indent: 20,
                      thickness: 0.1,
                      endIndent: 20,
                      color: Colors.black,
                    ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Version',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '1.0',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 70,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Get.isDarkMode
                    ? Colors.white38
                    : Colors.black.withOpacity(0.1)),
            child: const Text('Add will be there...'),
          )
        ],
      ),
    );
  }
}
