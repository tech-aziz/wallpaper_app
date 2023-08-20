
import 'package:get/get.dart';

class NavbarController extends GetxController{
   RxInt selectedIndex = 0.obs;

  onItemTapped(int index) {
    selectedIndex.value = index;
  }
}