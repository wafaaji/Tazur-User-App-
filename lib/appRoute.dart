import 'package:get/get.dart';
import 'package:graduation_project/modules/PINCode/PINCodeScreen.dart';
import 'package:graduation_project/modules/add-information/addInformationScreen.dart';
import 'package:graduation_project/modules/all-companies/allCompaniesScreen.dart';
import 'package:graduation_project/modules/apply-consultation/applyConsultationDefinitionScreen.dart';
import 'package:graduation_project/modules/apply-consultation/applyConsultationScreen.dart';
import 'package:graduation_project/modules/auth/authScreen.dart';
import 'package:graduation_project/modules/basic-information-profile/basicInformationScreen.dart';
import 'package:graduation_project/modules/companies-filter/companyFilterScreen.dart';
import 'package:graduation_project/modules/companies-filter/companyFilterDisplayScreen.dart';
import 'package:graduation_project/modules/companies/companiesScreen.dart';
import 'package:graduation_project/modules/company-details/companyDetailsScreen.dart';
import 'package:graduation_project/modules/consultation/consultationScreen.dart';
import 'package:graduation_project/modules/course-details/courseDetailsScreen.dart';
import 'package:graduation_project/modules/course-filter/courseFilterDisplayScreen.dart';
import 'package:graduation_project/modules/course-filter/courseFilterScreen.dart';
import 'package:graduation_project/modules/cv-information/cvInformationScreen.dart';
import 'package:graduation_project/modules/experience/updateExperienceScreen.dart';
import 'package:graduation_project/modules/forget-password/forget-password-first-step/forgetPasswordFirstStepScreen.dart';
import 'package:graduation_project/modules/forget-password/forget-password-second-step/forgetPasswordSecondStepScreen.dart';
import 'package:graduation_project/modules/home/homeScreen.dart';
import 'package:graduation_project/modules/job-details/jobDetailsScreen.dart';
import 'package:graduation_project/modules/job-filter/jobFilterDisplayScreen.dart';
import 'package:graduation_project/modules/job-filter/jobFilterScreen.dart';
import 'package:graduation_project/modules/link/updateLinkScreen.dart';
import 'package:graduation_project/modules/login/loginScreen.dart';
import 'package:graduation_project/modules/notification/notificationScreen.dart';
import 'package:graduation_project/modules/onboarding/onboardingScreen.dart';
import 'package:graduation_project/modules/personal-information-profile/profilePersonalInformationScreen.dart';
import 'package:graduation_project/modules/profile/profileScreen.dart';
import 'package:graduation_project/modules/reference/updateReferenceScreen.dart';
import 'package:graduation_project/modules/register/registerScreen.dart';
import 'package:graduation_project/modules/settings/settingsScreen.dart';
import 'package:graduation_project/modules/splash/splashScreen.dart';
import 'package:graduation_project/modules/survey-details/surveyDetailsScreen.dart';
import 'package:graduation_project/modules/surveys/surveysScreen.dart';
import 'package:graduation_project/modules/terget-job-profile/targetJobScreen.dart';
import 'package:graduation_project/modules/training-course/updateTrainingCourseScreen.dart';


List<GetPage> appPages = [

  //GetPage(name: '/home', page: () => Home()),
  GetPage(name: '/onboarding', page: () => OnboardingScreen()),
  GetPage(name: '/splash', page: () => SplashScreen()),
  GetPage(name: '/auth', page: () => AuthScreen()),
  GetPage(name: '/login', page: () => LoginScreen()),
  GetPage(name: '/register', page: () => RegisterScreen()),
  GetPage(name: '/pinCode', page: () => PINCodeScreen()),
  GetPage(name: '/forgetPasswordFirstStep', page: () => ForgetPasswordFirstStepScreen()),
  GetPage(name: '/forgetPasswordSecondStep', page: () => ForgetPasswordSecondStepScreen()),
  GetPage(name: '/addInformation', page: () => AddInformationScreen()),
  GetPage(name: '/home', page: () => HomeScreen()),
  GetPage(name: '/applyConsultationDefinition', page: () => ApplyConsultationDefinitionScreen()),
  GetPage(name: '/applyConsultation', page: () => ApplyConsultationScreen()),
  GetPage(name: '/surveys', page: () => SurveysScreen()),
  GetPage(name: '/companies', page: () => CompaniesScreen()),
  GetPage(name: '/notification', page: () => NotificationScreen()),
  GetPage(name: '/settings', page: () => SettingsScreen()),
  GetPage(name: '/jobDetails', page: () => JobDetailsScreen()),
  GetPage(name: '/courseDetails', page: () => CourseDetailsScreen()),
  GetPage(name: '/filter', page: () => JobFilterScreen()),
  GetPage(name: '/filterDisplay', page: () => JobFilterDisplayScreen()),
  GetPage(name: '/profile', page: () => ProfileScreen()),
  GetPage(name: '/basicInformation', page: () => ProfileBasicInformationScreen()),
  GetPage(name: '/personalInformation', page: () => ProfilePersonalInformationScreen()),
  GetPage(name: '/targetJob', page: () => ProfileTargetJobScreen()),
  GetPage(name: '/cvInformation', page: () => ProfileCVInformationScreen()),
  GetPage(name: '/filterCourse', page: () => CourseFilterScreen()),
  GetPage(name: '/filterDisplayCourse', page: () => CourseFilterDisplayScreen()),
  GetPage(name: '/surveyDetails', page: () => SurveyDetailsScreen()),
  GetPage(name: '/companyDetails', page: () => CompanyDetailsScreen()),
  GetPage(name: '/allCompanies', page: () => AllCompaniesScreen()),
  GetPage(name: '/filterCompany', page: () => CompanyFilterScreen()),
  GetPage(name: '/filterDisplayCompany', page: () => CompanyFilterDisplayScreen()),
  GetPage(name: '/updateExperience', page: () => UpdateExperienceScreen()),
  GetPage(name: '/updateTrainingCourse', page: () => UpdateTrainingCourseScreen()),
  GetPage(name: '/updateReference', page: () => UpdateReferenceScreen()),
  GetPage(name: '/updateLink', page: () => UpdateLinkScreen()),
  GetPage(name: '/consultation', page: () => ConsultationScreen()),

];
