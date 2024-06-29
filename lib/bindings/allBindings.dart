import 'package:get/get.dart';
import 'package:graduation_project/language/localController.dart';
import 'package:graduation_project/modules/PINCode/PINCodeController.dart';
import 'package:graduation_project/modules/add-information/addInformationController.dart';
import 'package:graduation_project/modules/all-companies/allCompaniesController.dart';
import 'package:graduation_project/modules/all-jobs/allJobsController.dart';
import 'package:graduation_project/modules/auth/authController.dart';
import 'package:graduation_project/modules/basic-information-profile/basicInformationController.dart';
import 'package:graduation_project/modules/companies-filter/companyFilterController.dart';
import 'package:graduation_project/modules/companies/companiesController.dart';
import 'package:graduation_project/modules/course-details/courseDetailsController.dart';
import 'package:graduation_project/modules/course-filter/courseFilterController.dart';
import 'package:graduation_project/modules/courses/coursesController.dart';
import 'package:graduation_project/modules/cv-information/cvInformationController.dart';
import 'package:graduation_project/modules/follow-companies/followCompaniesController.dart';
import 'package:graduation_project/modules/forget-password/forget-password-first-step/forgetPasswordFirstStepController.dart';
import 'package:graduation_project/modules/forget-password/forget-password-second-step/forgetPasswordSecondStepController.dart';
import 'package:graduation_project/modules/home/homeController.dart';
import 'package:graduation_project/modules/job-details/jobDetailsController.dart';
import 'package:graduation_project/modules/job-filter/jobFilterController.dart';
import 'package:graduation_project/modules/login/loginController.dart';
import 'package:graduation_project/modules/my-jobs/myJobsController.dart';
import 'package:graduation_project/modules/onboarding/onboardingController.dart';
import 'package:graduation_project/modules/personal-information-profile/personalInformationController.dart';
import 'package:graduation_project/modules/profile/profileController.dart';
import 'package:graduation_project/modules/register/registerController.dart';
import 'package:graduation_project/modules/settings/settingsController.dart';
import 'package:graduation_project/modules/survey-details/surveyDetailsController.dart';
import 'package:graduation_project/modules/surveys/surveysController.dart';

class allBindings extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => OnboardingController());
    Get.put(LocaleController());
    Get.put(AuthController());
    Get.put(LoginController());
    Get.put(RegisterController());
    Get.lazyPut(() => PINCodeController(Get.arguments));
    Get.lazyPut(() => ForgetPasswordFirstStepController());
    Get.lazyPut(() => ForgetPasswordSecondStepController(Get.arguments));
    Get.put(AddInformationController());
    Get.put(HomeController());
    // Get.lazyPut(() => MyJobsController());
    // Get.lazyPut(() => AllJobsController());
    Get.lazyPut(() => JobDetailsController());
    Get.lazyPut(() => JobFilterController());
   // Get.lazyPut(() => CoursesController());
    Get.lazyPut(() => CourseDetailsController());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => BasicInformationController());
    Get.lazyPut(() => PersonalInformationController());
    Get.lazyPut(() => CVInformationController());
    Get.lazyPut(() => CompaniesController());
    Get.lazyPut(() => AllCompaniesController());
    Get.lazyPut(() => FollowCompaniesController());
    Get.lazyPut(() => CompanyFilterController());
    Get.lazyPut(() => CourseFilterController());
    Get.lazyPut(() => SurveysController());
    Get.lazyPut(() => SurveyDetailsController());
    // Get.lazyPut(() => ProfileController());

  }
}