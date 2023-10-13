import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store_redirect/store_redirect.dart';
import '../utils/utils.dart';

class CustomNavigationDrawer extends StatefulWidget {
  const CustomNavigationDrawer({super.key});

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  // void showRateUsDialog() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (context) {
  //       return AlertDialog(
  //         shape: const RoundedRectangleBorder(
  //             borderRadius:
  //                 BorderRadius.all(Radius.circular(Utils.defaultBorderRadius))),
  //         title: Column(
  //           children: [
  //             Text('How would you rate app?',
  //                 style: GoogleFonts.lato(
  //                   textStyle: Theme.of(context).textTheme.displayLarge,
  //                   fontSize: Utils.mediumTextSize,
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.w900,
  //                   fontStyle: FontStyle.italic,
  //                 )),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             const Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Icon(
  //                   Icons.star,
  //                   size: 30,
  //                 ),
  //                 Icon(Icons.star, size: 30),
  //                 Icon(Icons.star, size: 30),
  //                 Icon(Icons.star, size: 30),
  //                 Icon(Icons.star, size: 30),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Text('Please Let us know How Can We Improve',
  //                 textAlign: TextAlign.center,
  //                 style: GoogleFonts.lato(
  //                   textStyle: Theme.of(context).textTheme.bodySmall,
  //                   fontSize: Utils.smallTextSize,
  //                   color: Colors.black.withOpacity(0.5),
  //                   fontWeight: FontWeight.w900,
  //                   fontStyle: FontStyle.italic,
  //                 )),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             const TextField(
  //               keyboardType: TextInputType.multiline,
  //               maxLines: null,
  //               decoration: InputDecoration(
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide:
  //                       BorderSide(color: Colors.greenAccent, width: 2.0),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(color: Colors.red, width: 2.0),
  //                 ),
  //                 hintText: 'Your Feedback!',
  //               ),
  //             ),
  //           ],
  //         ),
  //         content: SingleChildScrollView(
  //           child: Builder(
  //             builder: (context) {
  //               // Get available height and width of the build area of this widget. Make a choice depending on the size.
  //               var height = MediaQuery.of(context).size.height;
  //               var width = MediaQuery.of(context).size.width;
  //               return SizedBox(
  //                 height: height * .1,
  //                 // width: width - 600,
  //               );
  //             },
  //           ),
  //         ),
  //         actions: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               ElevatedButton(onPressed: () {
  //                 Navigator.pop(context);
  //               }, child: const Text('Cancel')),
  //               ElevatedButton(onPressed: () {
  //                 Navigator.pop(context);
  //               }, child: const Text('Submit'))
  //             ],
  //           ),
  //           SizedBox(
  //             height: 12,
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

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
            if(response.rating < 3){
                //send their comments to your emails
              // ask the user to contact you instead of leaving a bad review
            }else{
              StoreRedirect.redirect(androidAppId: 'com.example.galleryapp',iOSAppId: 'com.example.galleryapp');
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
    final size = MediaQuery.sizeOf(context);
    return Drawer(
      width: size.width * 0.65,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Utils.defaultBorderRadius),
              bottomRight: Radius.circular(12))),
      child: ListView(
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
                  Navigator.pop(context);
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
                title: const Text(
                  'Dark Mode',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    Get.changeThemeMode(
                        Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                      Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
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
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
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
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Share.share('com.example.galleryapp');
                },
                title: const Text('Share',
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
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
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
              ),
              AboutListTile(
                icon: Get.isDarkMode
                    ? SvgPicture.asset(
                  'assets/icons/info.svg',
                  color: Colors.white,
                  height: 22,
                )
                    : SvgPicture.asset(
                  'assets/icons/info.svg',
                  height: 22,
                  color: Colors.red,
                ),
                applicationName: 'Happy Wall',
                applicationVersion: '1.0',
                applicationLegalese: 'SoftLeads.com',
                child: const Text('About App',
                    style: TextStyle(fontWeight: FontWeight.bold)),
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
              ),
            ],
          ),
        ],
      ),
    );
  }

}
