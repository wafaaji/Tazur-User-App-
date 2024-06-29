import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/multi-select-dropdown/BaseController.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/model/AddInformationModel.dart';
import 'package:graduation_project/modules/add-information/addInformationService.dart';
import 'package:graduation_project/modules/add-information/steps-screens/basicInformationScreen.dart';
import 'package:graduation_project/modules/add-information/steps-screens/targetJobScreen.dart';
import 'steps-screens/personalInformationScreen.dart';

class AddInformationController extends BaseController {
  var currentStep = 0.obs;
  late TextEditingController firstNameController, lastNameController, addressController;
  var firstName = '';
  var lastName = '';
  var address = '';

  // Governorate
  final selectGovernorate = "damascus".tr.obs;
  void setSelectedGovernorate(String value) {
    selectGovernorate.value = value;
  }

  // FamilyState
  final selectFamilyState = "single".tr.obs;
  void setSelectedFamilyState(String value) {
    selectFamilyState.value = value;
  }

  // Nationality
  final selectNationality = "syrian".tr.obs;
  void setSelectedNationality(String value) {
    selectNationality.value = value;
  }

  // Experience Years
  final selectExperienceYears = "none".tr.obs;
  void setSelectedExperienceYears(String value) {
    selectExperienceYears.value = value;
  }

  // Education
  final selectEducation = "none".tr.obs;
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
  final selectMilitaryServices = "exempt".tr.obs;
  void setSelectedMilitaryServices(String value) {
    selectMilitaryServices.value = value;
  }

  // Current Job
  final selectCurrentJob = "unemployed".tr.obs;
  void setSelectedCurrentJob(String value) {
    selectCurrentJob.value = value;
  }

  // for add information api
  late AddInformationService service;
  var addInformationStatus;
  var message;

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    addressController = TextEditingController();

    service = AddInformationService();
    addInformationStatus = false;
    message = '';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
  }

  List<Step> getSteps() =>
      [
        Step(
          state: currentStep.value > 0 ? StepState.complete : StepState
              .indexed,
          isActive: currentStep.value >= 0,
          title: SizedBox.shrink(),
          content: Column(
            children: [
              CustomText(
                text: 'personal information'.tr,
                color: primaryBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 10,
              ),
              PersonalInformationScreen(
                controllerFirstName: firstNameController,
                controllerLastName: lastNameController,
                controllerAddress: addressController,
              ),
            ],
          ),
        ), // Hides the default title
        Step(
          state: currentStep.value > 1 ? StepState.complete : StepState
              .indexed,
          isActive: currentStep.value >= 1,
          title: SizedBox.shrink(), // Hides the default title
          content: Column(
            children: [
              CustomText(
                text: 'basic information'.tr,
                color: primaryBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 10,
              ),
              BasicInformationScreen(
              ),
            ],
          ),
        ),
        Step(
          state: currentStep.value > 2 ? StepState.complete : StepState
              .indexed,
          isActive: currentStep.value >= 2,
          title: SizedBox.shrink(), // Hides the default title
          content: Column(
            children: [
              CustomText(
                text: 'target job'.tr,
                color: primaryBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 10,
              ),
              TargetJobScreen(),
            ],
          ),
        ),
      ];

  void handleContinue() {
    if (currentStep.value != getSteps().length - 1) {
      currentStep.value += 1;
    }
  }

  void handleCancel() {
    if (currentStep.value != 0) {
      currentStep.value -= 1;
    }
  }

  // Add Information API (Send Information To Server)
  Future<void> AddInformationOnClick() async{
    DateTime birthday = getSelectedBirthday();
    firstName = firstNameController.text;
    lastName = lastNameController.text;
    address = addressController.text;
    // Convert gender number to string
    String genderString;
    if (selectedGender.value == 1) {
      genderString = 'male'.tr;
    } else {
      genderString = 'female'.tr;
    }

    AddInformationModel addInformation = AddInformationModel(
      first_name: firstName,
      last_name: lastName,
      governorate: selectGovernorate.value,
      address: address,
      marital_status: selectFamilyState.value,
      nationality: selectNationality.value,
      experience_years: selectExperienceYears.value,
      education: selectEducation.value,
      gender: genderString,
      driving_license: driverLicense.value,
      military_status: selectMilitaryServices.value,
      topic: selectedTopicItems,
      job_environment: selectedJobEnvironmentItems,
      job_time: selectedJobTimeItems,
      work_city: selectedWorkCityItems,
      job_current: selectCurrentJob.value,
      birthday: birthday,
    );
    print("______________Add Information Controller________________");
    addInformationStatus = await service.AddInformation(addInformation);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

}
