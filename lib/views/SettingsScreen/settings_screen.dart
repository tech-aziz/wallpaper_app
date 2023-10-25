import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/views/MainScreen/main_screen.dart';
import 'package:wallpaper_app/views/utils/styles.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:slide_rating_dialog/slide_rating_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

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
              buttonColor: Get.isDarkMode ? Colors.red : Colors.blue,
              onRatingChanged: (rating) {
              },
              cancelButton: true,
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
                                  // ignore: deprecated_member_use
                                  color: Colors.white,
                                )
                              : SvgPicture.asset(
                                  'assets/icons/remove_ad.svg',
                                  // ignore: deprecated_member_use
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
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/home.svg',
                        // ignore: deprecated_member_use
                        color: Colors.red,
                      ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                leading: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/dark_or_light.svg',
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/dark_or_light.svg',
                        // ignore: deprecated_member_use
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
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/privacy.svg',
                        // ignore: deprecated_member_use
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
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/rate_us.svg',
                        // ignore: deprecated_member_use
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
                        // ignore: deprecated_member_use
                        color: Colors.white,
                        height: 20,
                      )
                    : SvgPicture.asset(
                        'assets/icons/feedback.svg',
                        // ignore: deprecated_member_use
                        color: Colors.red,
                        height: 22,
                      ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                  Get.back();
                  Share.share('com.example.wallpaper_app');
                },
                title: const Text('Share with friends',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/share.svg',
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/share.svg',
                        // ignore: deprecated_member_use
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
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/update.svg',
                        // ignore: deprecated_member_use
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
                        // ignore: deprecated_member_use
                        color: Colors.white,
                        height: 22,
                      )
                    : SvgPicture.asset(
                        'assets/icons/info.svg',
                        // ignore: deprecated_member_use
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
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/exit.svg',
                        // ignore: deprecated_member_use
                        color: Colors.red,
                      ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                },
                title: const Text('Remove Ads',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/remove_ad.svg',
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      )
                    : SvgPicture.asset(
                        'assets/icons/remove_ad.svg',
                        // ignore: deprecated_member_use
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
