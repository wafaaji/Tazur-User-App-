import 'package:get/get.dart';


class HomeController extends GetxController {
  var selectedIndex = 2.obs;
  var textValue = 2.obs;

  void changeIndex(int index){
    selectedIndex.value = index;
  }

  void increaseValue(){
    textValue.value++;
  }
}
