import 'package:get/get.dart';

class DetailController extends GetxController {
  var favorite = 0.obs;

  //Message favorite
  void favCounter() {
    if(favorite.value == 1) {
      Get.snackbar('Gostei', 'Você já curtiu esse');
    } else {
      favorite.value++;
      Get.snackbar('Gostei', 'Você curtiu esse');
    }
  }
}