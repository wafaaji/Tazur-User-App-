import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/appRoute.dart';
import 'package:graduation_project/bindings/allBindings.dart';
import 'package:graduation_project/language/local.dart';
import 'package:graduation_project/language/localController.dart';
import 'package:graduation_project/modules/auth/authScreen.dart';
import 'package:graduation_project/modules/companies/companiesScreen.dart';
import 'package:graduation_project/modules/company-details/companyDetailsScreen.dart';
import 'package:graduation_project/modules/course-details/courseDetailsScreen.dart';
import 'package:graduation_project/modules/forget-password/forget-password-first-step/forgetPasswordFirstStepScreen.dart';
import 'package:graduation_project/modules/forget-password/forget-password-second-step/forgetPasswordSecondStepScreen.dart';
import 'package:graduation_project/modules/home/homeScreen.dart';
import 'package:graduation_project/modules/job-details/jobDetailsScreen.dart';
import 'package:graduation_project/modules/login/loginController.dart';
import 'package:graduation_project/modules/login/loginScreen.dart';
import 'package:graduation_project/modules/my-jobs/myJobsScreen.dart';
import 'package:graduation_project/modules/onboarding/onboardingScreen.dart';
import 'package:graduation_project/modules/profile/profileScreen.dart';
import 'package:graduation_project/modules/register/registerScreen.dart';
import 'package:graduation_project/modules/add-information/addInformationScreen.dart';
import 'package:graduation_project/modules/splash/splashScreen.dart';
import 'package:graduation_project/modules/settings/settingsScreen.dart';
import 'package:graduation_project/modules/surveys/surveysScreen.dart';
import 'package:graduation_project/test.dart';

void main() async{
  await GetStorage.init();

  // Check if the user has seen the onboarding screen before
  bool seenOnboarding = GetStorage().read('seenOnboarding') ?? false;

  Get.put(LocaleController());
  // Run the app with appropriate initial route
  runApp(MyApp(initialRoute: seenOnboarding ? '/splash' : '/onboarding'));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({required this.initialRoute, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controllerLang = Get.put(LocaleController());
    return GetMaterialApp(
      initialBinding: allBindings(),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Final Project',
      locale: controllerLang.currentLang,
      translations: MyLocal(),
      getPages: appPages,
      initialRoute: initialRoute,
      // home: SplashScreen(),
    );
  }
}

