import 'package:get/get.dart';
import 'package:graduation_project/model/updateBasicInformationModel.dart';
import 'package:graduation_project/modules/basic-information-profile/basicInformationService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class BasicInformationController extends GetxController {
  var isLoading = true.obs;
  SecureStorage storage = SecureStorage();

  // Experience Years
  final selectExperienceYears = "".obs;
  void setSelectedExperienceYears(String value) {
    selectExperienceYears.value = value;
  }

  // Education
  final selectEducation = "".obs;
  void setSelectedEducation(String value) {
    selectEducation.value = value;
  }

  // Birthday
  RxInt selectedDay = 1.obs;
  RxInt selectedMonth = 1.obs;
  RxInt selectedYear = 2000.obs;
  List<int> days = List.generate(31, (index) => index + 1);
  List<int> months = List.generate(12, (index) => index + 1);
  List<int> years = List.generate(100, (index) => DateTime.now().year - index);
  void updateSelectedDay(int? value) {
    if (value != null) selectedDay.value = value;
  }
  void updateSelectedMonth(int? value) {
    if (value != null) selectedMonth.value = value;
  }
  void updateSelectedYear(int? value) {
    if (value != null) selectedYear.value = value;
  }
  DateTime getSelectedBirthday() {
    return DateTime(selectedYear.value, selectedMonth.value, selectedDay.value);
  }

  // Gender
  var selectedGender = 1.obs; // 1 for Male, 2 for Female
  void updateSelectedGender(int value) {
    selectedGender.value = value;
  }

  // Driver Licence
  var driverLicense = false.obs;
  void toggleDriverLicense(bool? value) {
    if (value != null) {
      driverLicense.value = value;
    }
  }

  // Military Services
  final selectMilitaryServices = "".obs;
  void setSelectedMilitaryServices(String value) {
    selectMilitaryServices.value = value;
  }

  // for update basic information api
  late BasicInformationService service;
  var updateBasicInformationStatus = false;
  var message;

  @override
  void onInit() {
    service = BasicInformationService();
    fetchBasicInformation();

    super.onInit();
  }

  void fetchBasicInformation() async {
    isLoading.value = true;
    var token = await storage.read("token");

    var basicInfo = await service.fetchBasicInformation(token);

    if (basicInfo != null) {
      selectExperienceYears.value = translateValue(basicInfo['experience_years']);
      selectEducation.value = translateValue(basicInfo['education']);
      // Extract day, month, and year from birthday
      DateTime birthdayDate = DateTime.parse(basicInfo['birthday']);
      selectedDay.value = birthdayDate.day;
      selectedMonth.value = birthdayDate.month;
      selectedYear.value = birthdayDate.year;
      // Map gender string to integer values
      if (basicInfo['gender'] == 'male' || basicInfo['gender'] == 'ذكر') {
        selectedGender.value = 1;
      } else if (basicInfo['gender'] == 'female' || basicInfo['gender'] == 'انثى') {
        selectedGender.value = 2;
      }
      if (basicInfo['driving_license'] == 1) {
        driverLicense.value = true;
      } else {
        driverLicense.value = false;
      }
      selectMilitaryServices.value = translateValue(basicInfo['military_status']);
    }
    isLoading.value = false;
    print('Experience Years:' + selectExperienceYears.value);
    print('Education:' + selectEducation.value);
    print('Day:' + selectedDay.value.toString());
    print('Month:' + selectedMonth.value.toString());
    print('Year:' + selectedYear.value.toString());
    print('Gender:' + selectedGender.value.toString());
    print('Driver License:' + driverLicense.value.toString());
    print('Military Services:' + selectMilitaryServices.value);
  }

  // Update Basic Information API
  Future<void> UpdateBasicInformation() async {
    DateTime birthday = getSelectedBirthday();
    // Convert gender number to string
    String genderString;
    if (selectedGender.value == 1) {
      genderString = 'male';
    } else {
      genderString = 'female';
    }
    print("Gender before translation: ${selectedGender.value}");
    print("Gender string to be sent: $genderString");
    try {
      var token = await storage.read("token");
      var updateBasicInformation = UpdateBasicInformationModel(
        experienceYears: selectExperienceYears.value,
        education: selectEducation.value,
        gender: genderString,
        drivingLicense: driverLicense.value,
        militaryStatus: selectMilitaryServices.value,
        birthday: birthday,
      );

      updateBasicInformationStatus =
      await service.UpdateBasicInformation(token, updateBasicInformation);
      message = service.message;

      if (message is List) {
        String temp = '';
        for (String s in message)
          temp += s + "\n";
        message = temp;
      }
    } catch (e) {
      print("Error updating personal information: $e");
      message = 'Error updating personal information: $e'.tr;
    }
  }

  String translateValue(String value) {
    final Map<String, String> arabicToEnglish = {
      'لا يوجد': 'None', '1 سنة': '1 Year', '2 سنة': '2 Years', '3 سنوات': '3 Years', '4 سنوات': '4 Years', '5 سنوات': '5 Years', '6 سنوات': '6 Years', '7 سنوات': '7 Years', '8 سنوات': '8 Years', '9 سنوات': '9 Years', '10 سنوات': '10 Years', 'أكثر من 10 سنوات': 'More Than 10 Years',
      'المدرسة الثانوية' : 'High School', 'الدرجة المؤسسية' : 'Institutional Degree', 'درجة البكالوريوس' : 'Bachelor Degree', 'دبلوم' : 'Diploma', 'درجة الماجستير' : 'Master Degree', 'دكتوراه' : 'Doctorate',
      'إعفاء' : 'Exempt', 'منتهى' : 'Finished', 'في الخدمة' : 'In Service', 'مؤجل' : 'Postponed',
    };

    final Map<String, String> englishToArabic = {
      'None': 'لا يوجد', '1 Year': '1 سنة', '2 Years': '2 سنة', '3 Years': '3 سنوات', '4 Years': '4 سنوات', '5 Years': '5 سنوات', '6 Years': '6 سنوات', '7 Years': '7 سنوات', '8 Years': '8 سنوات', '9 Years': '9 سنوات', '10 Years': '10 سنوات', 'More Than 10 Years': 'أكثر من 10 سنوات',
      'High School' : 'المدرسة الثانوية', 'Institutional Degree' : 'الدرجة المؤسسية', 'Bachelor Degree' : 'درجة البكالوريوس', 'Diploma' : 'دبلوم', 'Master Degree' : 'درجة الماجستير', 'Doctorate' : 'دكتوراه',
      'Exempt' : 'إعفاء', 'Finished' : 'منتهى', 'In Service' : 'في الخدمة', 'Postponed' : 'مؤجل',
    };

    if (Get.locale?.languageCode == 'ar') {
      return englishToArabic[value] ?? value;
    } else {
      return arabicToEnglish[value] ?? value;
    }
  }
}