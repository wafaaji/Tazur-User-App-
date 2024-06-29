import 'package:get/get.dart';
import 'package:graduation_project/modules/settings/logoutService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class SettingsController extends GetxController{

  // Logout
  late LogoutService service;
  var logoutStatus;
  var message;
  late SecureStorage storage;

  @override
  void onInit() {
    service = LogoutService();
    logoutStatus = false;
    message = '';
    storage = SecureStorage();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // Logout API
  Future<void> logoutOnClick() async{
    String? token = await storage.read("token");
    print("______________logout________________");
    print(token);
    logoutStatus = await service.logout(token);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

}