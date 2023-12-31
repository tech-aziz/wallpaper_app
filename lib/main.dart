import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wallpaper_app/bindings/all_bindings.dart';
import 'package:wallpaper_app/views/SplashScreen/splash_screen.dart';
import 'package:wallpaper_app/views/utils/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter/services.dart';

void main() async {
  AllBindings().dependencies();
  await GetStorage.init(); // Initialize get storage driver
  //for downloading image
  WidgetsFlutterBinding.ensureInitialized();
  //fixed portrait mode
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper-App',
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.red),
      darkTheme: darkThemeData,
      home: const SplashScreen(),
    );
  }
}
