import 'package:get/get.dart';
import 'package:graduation_project/components/multi-select-dropdown/BaseController.dart';
import 'package:graduation_project/model/companiesModel.dart';
import 'package:graduation_project/model/filterCompanyModel.dart';
import 'package:graduation_project/modules/companies-filter/companyFilterService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class CompanyFilterController extends BaseController {
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;

  //for display Filter Companies
  late FilterCompanyService serviceFilterDisplay;
  var filterCompaniesList = <Companies>[].obs;
  late List<Companies> filterCompanies= [];

  // For Pagination
  var filterPage = 1;
  var isFetching = false;

  @override
  void onInit() async{
    // For Filter
    serviceFilterDisplay = FilterCompanyService();
    fetchFilterData(); // Fetch data when the controller is initialized

    var token = await storage.read("token");
    print(token);
    super.onInit();
  }

  void onScroll() {
    if (!isFetching) {
      isFetching = true;
      filterPage++;
      fetchFilterData().then((_) {
        isFetching = false;
      });
    }
  }

  // For Filter API
  Future<void> fetchFilterData() async {
    isLoading.value = true;
    FilterCompanyModel filterCompanyModel = FilterCompanyModel (
      topic: selectedTopicFilterItems,
      work_city: selectedWorkCityItems,
    );

    var token = await storage.read("token");
    print(token);
    var newCompanies = await serviceFilterDisplay.displayFilterCompanies(token, filterCompanyModel ,filterPage);

    filterCompanies.addAll(newCompanies);
    filterCompaniesList.value = filterCompanies;

    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }


}