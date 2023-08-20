import 'package:flutter/material.dart';
import 'package:galleryapp/src/bindings/all_bindings.dart';
import 'package:galleryapp/src/features/splash_screen.dart';
import 'package:galleryapp/src/utils/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter/services.dart';

void main() {
  AllBindings().dependencies();
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
        theme: lightThemeData,
        darkTheme: darkThemeData,
        home: const SplashScreen(),

        // themeMode: ThemeMode.system,
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSwatch(
        //     primarySwatch: Colors.green
        //   )
        // ),
        // theme:
        //     ThemeScreen.mode ? ThemeScreen.darkTheme : ThemeScreen.lightTheme,

        //always dark theme or ThemeData.light() => always light theme

        // darkTheme: ThemeData(
        //   brightness: Brightness.dark,
        // ),
        // themeMode: ThemeMode.dark,
        // home: const MainScreen()
        // home: const PracticeWidget(),
        );
  }
}
