import 'package:get/get.dart';
import 'package:graduation_project/model/companyDetailsModel.dart';
import 'package:graduation_project/model/followUnfollowCompanyModel.dart';
import 'package:graduation_project/modules/company-details/companyDetailsService.dart';
import 'package:graduation_project/modules/company-details/followUnfollowCompanyService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class CompanyDetailsController extends GetxController {
  var selectedIndex = 0.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  // For Company Details API
  SecureStorage storage = SecureStorage();
  RxInt companyId = 0.obs;
  var isLoading = true.obs;
  late CompanyDetailsService detailsService;
  Rx<CompanyDetailsModel?> companyDetails = Rx<CompanyDetailsModel?>(null);
  RxString error = RxString('');

  // For Follow UnFollow API
  late FollowUnfollowCompanyService followUnfollowService;
  var followUnfollowStatus;
  var message;

  @override
  void onInit() {
    super.onInit();
    detailsService = CompanyDetailsService();
    if (Get.arguments != null) {
      processCompanyDetails(Get.arguments);
    }
    fetchCompanyDetails();
    print('Received company id: $companyId');
    // For Follow Unfollow
    followUnfollowService = FollowUnfollowCompanyService();
    followUnfollowStatus = false;
    message = '';
  }

  void fetchCompanyDetails() async {
    isLoading.value = true;
    try {
      var token = await storage.read("token");
      final details = await detailsService.displayCompanyDetails(token!, companyId.value);
      if (details != null) {
        companyDetails.value = details;
      } else {
        throw Exception('Company details not found');
      }
    } catch (e) {
      print('Error fetching company details: $e');
      error.value = 'Error fetching company details: $e';
    }
    isLoading.value = false;
  }

  void processCompanyDetails(int companyId) {
    this.companyId.value = companyId;
    print('Received company id: $companyId');
  }

  // For Follow Unfollow API
  Future<void> followUnfollowOnClick() async{
    FollowUnfollowCompanyModel followUnfollow = FollowUnfollowCompanyModel(
    );
    print("______________Follow Unfollow Controller________________");

    var token = await storage.read("token");
    print(token);
    followUnfollowStatus = await followUnfollowService.followUnfollowCompany(token, companyId.value, followUnfollow);
    message = followUnfollowService.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

}