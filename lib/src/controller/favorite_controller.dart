import 'package:get/get.dart';

class FavoriteController extends GetxController{
  var favIncrementValue = 0.obs;

   favoriteIncrement(){
    favIncrementValue.value++;
  }
}