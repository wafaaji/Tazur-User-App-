import 'package:get/get.dart';
import 'package:graduation_project/model/companiesModel.dart';
import 'package:graduation_project/modules/follow-companies/followCompaniesService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class FollowCompaniesController extends GetxController {
  var isLoading = true.obs;
  SecureStorage storage = SecureStorage();

  // For Follow Companies API
  late FollowCompaniesService serviceDisplay;
  var followCompaniesList = <Companies>[].obs;
  late List<Companies> followCompanies = [];

  // For Pagination
  var page = 1;
  var isFetching = false;

  @override
  void onInit() async{
    var token = await storage.read("token");
    print(token);
    serviceDisplay = FollowCompaniesService();
    fetchData(); // Fetch data when the controller is initialized
    super.onInit();
  }

  Future<void> fetchData() async {
    isLoading.value = true;

    var token = await storage.read("token");
    print(token);
    var newCompanies = await serviceDisplay.displayFollowCompanies(token,page);

    followCompanies.addAll(newCompanies);
    followCompaniesList.value = followCompanies;

    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  void onScroll() {
    if (!isFetching) {
      isFetching = true;
      page++;
      fetchData().then((_) {
        isFetching = false;
      });
    }
  }

}