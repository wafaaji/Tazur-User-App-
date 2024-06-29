import 'package:get/get.dart';
import 'package:graduation_project/model/surveyModel.dart';
import 'package:graduation_project/modules/surveys/surveysService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class SurveysController extends GetxController {
  var isLoading = true.obs;
  SecureStorage storage = SecureStorage();

  // For My Surveys API
  late SurveysService serviceDisplay;
  var surveysList = <Survey>[].obs;
  late List<Survey> surveys = [];

  // For Pagination
  var page = 1;
  var isFetching = false;

  @override
  void onInit() async{
    serviceDisplay = SurveysService();
    fetchData();
    super.onInit();
  }


  Future<void> fetchData() async {
    isLoading.value = true;

    var token = await storage.read("token");
    print(token);
    var newSurveys = await serviceDisplay.displaySurveys(token,page);

    // newSurveys.addAll(newSurveys);
    // surveysList.value = surveys;

    // Instead of modifying newSurveys directly, add the fetched surveys to surveysList
    surveysList.addAll(newSurveys);

    // Update the surveys list for future pagination
    surveys.addAll(newSurveys);

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