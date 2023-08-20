
import 'package:get/get.dart';

import '../controller/favorite_controller.dart';
import '../controller/navbar_controller.dart';

class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController());
    Get.lazyPut(() => NavbarController());
  }

}