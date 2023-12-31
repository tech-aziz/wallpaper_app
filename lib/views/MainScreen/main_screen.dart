import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/components/custom_button.dart';
import 'package:wallpaper_app/controller/favorite_controller.dart';
import 'package:wallpaper_app/controller/navbar_controller.dart';
import 'package:wallpaper_app/views/utils/colors.dart';
import 'package:get/get.dart';
import '../HomeScreen/home_screen.dart';
import '../AlbumsScreen/albums_screen.dart';
import '../FavoriteScreen/favorite_screen.dart';
import '../SettingsScreen/settings_screen.dart';
import '../utils/styles.dart';

class MainScreen extends StatefulWidget {
  final int? index;

  const MainScreen({super.key, this.index});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final NavbarController navbarController = Get.put(NavbarController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var currentIndex = 0;

  //List of pages
  List pages = [
    const HomeScreen(),
    FavoriteScreen(),
    const AlbumsScreen(),
    const MenuScreen()
  ];

  // for exit popup dialog
  Future<bool> showExitPopup() async {
    return await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              alignment: Alignment.center,
              content: Text('Do you want to close the app?',
                  style: Style.globalTextStyle(
                      fontSize: 19,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 0.9)),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          exit(0);
                        },
                        child: customButton(
                          textColor:
                              Get.isDarkMode ? Colors.white : Colors.black,
                          btnName: 'Yes',
                          borderColor: Get.isDarkMode
                              ? AppColors.primaryColor
                              : Colors.black.withOpacity(.1),
                          context: context,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: customButton(
                            textColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                            btnName: 'No',
                            borderColor: Get.isDarkMode
                                ? AppColors.primaryColor
                                : Colors.black.withOpacity(.1),
                            context: context),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        showExitPopup();
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // selectedFontSize: 0,
            // unselectedFontSize: 0,
            // showSelectedLabels: false,
            // showUnselectedLabels: false,
            selectedLabelStyle: TextStyle(color: AppColors.primaryColor),
            unselectedLabelStyle:
                TextStyle(color: AppColors.secondaryColorDarkTheme),
            elevation: 0,
            selectedItemColor: Colors.red,
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
                          // ignore: deprecated_member_use
                          color: Colors.white)
                      : SvgPicture.asset('assets/icons/home.svg',
                          // ignore: deprecated_member_use
                          color: Colors.red),
                  // icon: Icon(Icons.apps_rounded),

                  label: 'Home'),
              BottomNavigationBarItem(
                // icon: Icon(Icons.bar_chart_sharp),
                // SvgPicture.asset('assets/icons/heart.svg'),
                icon: Stack(
                  // clipBehavior: Clip.none,
                  children: [
                    Get.isDarkMode
                        ? SvgPicture.asset(
                            'assets/icons/heart.svg',
                            // ignore: deprecated_member_use
                            color: Colors.white,
                          )
                        : SvgPicture.asset(
                            'assets/icons/heart.svg',
                            // ignore: deprecated_member_use
                            color: Colors.red,
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
                              // ignore: deprecated_member_use
                              color: Colors.white,
                            )
                          : SvgPicture.asset(
                              'assets/icons/album.svg',
                              // ignore: deprecated_member_use
                              color: Colors.red,
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
                          // ignore: deprecated_member_use
                          color: Colors.white,
                          height: 25,
                        )
                      : SvgPicture.asset(
                          'assets/icons/more.svg',
                          // ignore: deprecated_member_use
                          color: Colors.red,
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
