import "dart:io";
import "package:get/get.dart";
import "package:graduation_project/model/showProfileModel.dart";
import "package:graduation_project/modules/profile/profileService.dart";
import "package:graduation_project/native-services/secureStorage.dart";
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {
  SecureStorage storage = SecureStorage();

  // For Show Profile API
  late ProfileService service;
  Rx<ShowProfileModel?> profile = Rx<ShowProfileModel?>(null);

  // For Upload CV
  Rx<File?> selectedFile = Rx<File?>(null);
  void onClickUpdate() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
      status = await Permission.storage.status;
    }
    if (status.isGranted) {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result == null) return;
      final file = result.files.first;
      openFile(file);
    } else {
      // Handle if permission is denied
      print('Permission denied to access storage');
    }
  }

  void openFile(PlatformFile file){
    OpenFile.open(file.path!);
  }

  @override
  void onInit() {
    service = ProfileService();
    fetchProfile();
    super.onInit();
  }

  Future<void> fetchProfile() async {
    try {
      var token = await storage.read("token");
      if (token != null) {
        final showProfile = await service.displayProfile(token);
        profile.value = showProfile;
      } else {
        print('Token is null');
      }
    } catch (e) {
      print('Error fetching profile: $e');
    }
  }

}