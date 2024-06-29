import 'package:get/get.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class SplashController extends GetxController {

  late SecureStorage storage;
  var loading = true;

  @override
  void onInit() async{
    super.onInit();
    print("aaa");
    await Future.delayed(Duration(seconds: 5));
    storage = SecureStorage();
    await checkToken();
  }

  @override
  void onReady(){
    print("bbb");
    super.onReady();
  }

  Future<void> checkToken() async {
    String? token = await storage.read("token");
    String? emailVerifiedAt = await storage.read("emailVerifiedAt");
    String? completeState = await storage.read("completeState");
    print("token: ${token}");
    print("emailVerifiedAt: ${emailVerifiedAt}");
    print("completeState: ${completeState}");

    if(token != null && emailVerifiedAt != 'null' && completeState != '0'){
      Get.offNamed('/home');
    }else {
      Get.offNamed('/auth');
    }

  }
}
