import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galleryapp/src/constants/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common_widgets/custom_button.dart';
import '../controller/favorite_controller.dart';
import '../controller/navbar_controller.dart';
import 'home_screen.dart';
import 'nav_screens/albums_screen.dart';
import 'nav_screens/favorite_screen.dart';
import 'nav_screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final NavbarController navbarController = Get.put(NavbarController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var currentIndex = 0;

  // onItemTapped() {
  //   setState(() {
  //
  //   });
  //   _scaffoldKey.currentState?.openDrawer();
  // }

  //List of pages
  List pages = [
    const HomeScreen(),
    FavoriteScreen(),
    const AlbumsScreen(),
    const MenuScreen()
  ];

  // final NavbarController navbarController = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              alignment: Alignment.center,
              content: Text('Do you want to close the app?',
                  style: GoogleFonts.lato(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  )),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          exit(0);
                        },
                        child: customButton(textColor: Get.isDarkMode ? Colors.white : Colors.black,
                            btnName: 'Yes',
                            borderColor: primaryColor,
                            context: context)),
                    Container(
                      height: 40,
                      width: .7,
                      color: Colors.black12.withOpacity(0.7),
                    ),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: customButton(
                            textColor: Get.isDarkMode ? Colors.white : Colors.black,
                            btnName: 'No',
                            borderColor: primaryColor,
                            context: context)),
                  ],
                )
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        key: _scaffoldKey,
        // backgroundColor: Colors.white,
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // selectedFontSize: 0,
            // unselectedFontSize: 0,
            // showSelectedLabels: false,
            // showUnselectedLabels: false,

            elevation: 0,
            // selectedItemColor: Colors.white,
            // unselectedItemColor: Colors.white.withOpacity(0.5),
            // currentIndex: navbarController.selectedIndex.toInt(),
            currentIndex: currentIndex,
            // onTap: navbarController
            //     .onItemTapped(navbarController.selectedIndex.toInt()),
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Get.isDarkMode
                      ? SvgPicture.asset('assets/icons/home.svg',
                          color: Colors.white)
                      : SvgPicture.asset('assets/icons/home.svg',
                          color: Colors.black),
                  // icon: Icon(Icons.apps_rounded),

                  label: 'Home'),
              BottomNavigationBarItem(
                // icon: Icon(Icons.bar_chart_sharp),
                // SvgPicture.asset('assets/icons/heart.svg'),
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Get.isDarkMode
                        ? SvgPicture.asset(
                            'assets/icons/heart.svg',
                            color: Colors.white,
                          )
                        : SvgPicture.asset(
                            'assets/icons/heart.svg',
                            color: Colors.black,
                          ),
                    // const Icon(Icons.heart_broken),
                    favoriteController.favIncrementValue.value == 0
                        ? const SizedBox()
                        : Positioned(
                            left: 20,
                            bottom: 12,
                            child: Container(
                              alignment: Alignment.center,
                              height: size.height / 50,
                              width: size.width / 24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black.withOpacity(0.1)),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  favoriteController.favIncrementValue
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 9, color: Colors.red),
                                ),
                              ),
                            ),
                          )
                  ],
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Get.isDarkMode
                          ? SvgPicture.asset(
                              'assets/icons/album.svg',
                              color: Colors.white,
                            )
                          : SvgPicture.asset(
                              'assets/icons/album.svg',
                              color: Colors.black,
                            ),
                      // const Icon(Icons.heart_broken),
                      favoriteController.favIncrementValue.value == 0
                          ? const SizedBox()
                          : Positioned(
                              left: 20,
                              bottom: 12,
                              child: Container(
                                alignment: Alignment.center,
                                height: size.height / 50,
                                width: size.width / 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.black.withOpacity(0.1)),
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    favoriteController.favIncrementValue
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 9, color: Colors.red),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                  label: 'Albums'),
              BottomNavigationBarItem(
                icon: Container(
                  child: Get.isDarkMode
                      ? SvgPicture.asset(
                          'assets/icons/more.svg',
                          color: Colors.white,
                          height: 25,
                        )
                      : SvgPicture.asset(
                          'assets/icons/more.svg',
                          color: Colors.black,
                          height: 25,
                        ),
                ),
                label: 'Settings',
              ),
            ]),
      ),
    );
  }
}
