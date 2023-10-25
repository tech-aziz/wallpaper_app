import 'package:flutter/material.dart';
import 'package:wallpaper_app/bindings/all_bindings.dart';
import 'package:wallpaper_app/views/SplashScreen/splash_screen.dart';
import 'package:wallpaper_app/views/utils/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter/services.dart';

void main() {
  AllBindings().dependencies();
  //for downloading image
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wallpaper-App',
        // theme: lightThemeData,
        theme: ThemeData(
            primarySwatch: Colors.red
        ),
        darkTheme: darkThemeData,
        home: const SplashScreen(),
        );
  }
}
