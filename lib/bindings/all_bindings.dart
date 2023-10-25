import 'package:get/get.dart';
import 'package:wallpaper_app/controller/favorite_controller.dart';
import 'package:wallpaper_app/controller/navbar_controller.dart';

class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController());
    Get.lazyPut(() => NavbarController());
  }

}