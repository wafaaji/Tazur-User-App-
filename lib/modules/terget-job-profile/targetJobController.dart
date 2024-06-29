import 'package:get/get.dart';
import 'package:graduation_project/components/multi-select-dropdown/BaseController.dart';
import 'package:graduation_project/model/updateTargetJobModel.dart';
import 'package:graduation_project/modules/terget-job-profile/targetJobService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class TargetJobController extends BaseController {
  var isLoading = true.obs;
  SecureStorage storage = SecureStorage();

  // Current Job
  final selectCurrentJob = "unemployed".tr.obs;
  void setSelectedCurrentJob(String value) {
    selectCurrentJob.value = value;
  }

  // for update target job api
  late TargetJobService service;
  var updateTargetJobStatus = false;
  var message;

  @override
  void onInit() {
    service = TargetJobService();
    fetchBasicInformation();

    super.onInit();
  }

  void fetchBasicInformation() async {
    isLoading.value = true;
    var token = await storage.read("token");

    var targetJobInfo = await service.fetchTargetJob(token);

    if (targetJobInfo != null) {
      List<dynamic> topicList = targetJobInfo['topic'];
      List<dynamic> jobEnvironmentList = targetJobInfo['job_environment'];
      List<dynamic> jobTimeList = targetJobInfo['job_time'];
      List<dynamic> workCityList = targetJobInfo['work_city'];

      if (topicList != null) {
        List<String> translatedTopics = topicList.map((topic) => translateValue(topic)).toList();
        setSelectedTopicItems(translatedTopics);
      }

      if (jobEnvironmentList != null) {
        List<String> translatedJobEnvironments = jobEnvironmentList.map((environment) => translateValue(environment)).toList();
        setSelectedJobEnvironmentItems(translatedJobEnvironments);
      }

      if (jobTimeList != null) {
        List<String> translatedJobTimes = jobTimeList.map((time) => translateValue(time)).toList();
        setSelectedJobTimeItems(translatedJobTimes);
      }

      if (workCityList != null) {
        List<String> translatedWorkCities = workCityList.map((city) => translateValue(city)).toList();
        setSelectedWorkCityItems(translatedWorkCities);
      }

      selectCurrentJob.value = translateValue(targetJobInfo['job_current']);
    }
    isLoading.value = false;
    print('Topic:' + selectedTopicItems.toString());
    print('Job Environment:' + selectedJobEnvironmentItems.toString());
    print('Job Time:' + selectedJobTimeItems.toString());
    print('Work City:' + selectedWorkCityItems.toString());
    print('Current Job:' + selectCurrentJob.value);
  }

  // Update Target Job API
  Future<void> UpdateTargetJob() async {
    try {
      var token = await storage.read("token");
      var updateTargetJob = UpdateTargetJobModel(
        topic: selectedTopicItems,
        jobEnvironment: selectedJobEnvironmentItems,
        jobTime: selectedJobTimeItems,
        workCity: selectedWorkCityItems,
        jobCurrent: selectCurrentJob.value,
      );

      updateTargetJobStatus =
      await service.UpdateTargetJob(token, updateTargetJob);
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
      'إدارة / عمليات': 'Administration / Operations / Management', 'إدخال بيانات / الأرشفة': 'Data Entry / Archiving', 'تخطيط / مستشار': 'Strategy / Consulting', 'البحث والتطوير / إحصائيات / المحلل': 'Research and Development / Statistics / Analyst', 'IT / تطوير البرمجيات': 'IT / Software Development', 'الخدمات المصرفية / تأمين': 'Banking / Insurance', 'التدبير المنزلي / ساعي المكتب / بواب': 'House Keeping / Office Boys / Porters', 'ترجمة / كتابة / تحرير': 'Translation / Writing / Editorial', 'تسويق / PR / دعاية': 'Marketing / PR / Advertising', 'التصميم الجرافيكي / الرسوم المتحركة / الفن': 'Graphic Design / Animation / Art',
      'تعليم / تدريس / تدريب' : 'Education / Teaching / Training', 'وسائل التواصل الأجتماعي / الصحافة / نشر' : 'Social Media / Journalism / Publishing', 'الجودة': 'Quality', 'أمان / خدمات الحراسة' : 'Safety / Guard Services', 'خدمة الزبائن / الدعم': 'Customer Service / Support', 'تصنيع / إنتاج': 'Manufacturing / Production','رياضة / تغذية / العلاج الطبيعي':'Sport / Nutrition / Physiotherapy', 'الزراعة': 'Farming and Agriculture', 'سائق / توصيل طلبات': 'Drivers / Delivery', 'سكرتارية / موظف الإستقبال': 'Secretarial / Receptionist', 'السياحة / السفر / الفنادق': 'Tourism / Travel / Hotels', 'الادوية' : 'Pharmaceutical',
      'الطب / الرعاية الصحية / التمريض' : 'Medical / Healthcare / Nursing', 'طب الأسنان / التركيبات':'Dentists / Prosthodontics', 'فني / عامل':'Technician / Workers', 'قانون / عقد':'Legal / Contracts', 'كيمياء / مختبرات':'Chemistry / Laboratories', 'الخدمات اللوجستية / مستودع / الموردين':'Logistics / Warehouse / Supply Chain', 'مبيعات / بيع بالتجزئة / توزيع':'Sales / Retail / Distribution', 'محاسبة / تمويل':'Accounting / Finance', 'مشروع / إدارة البرنامج':'Project / Program Management', 'شراء / تحصيل':'Purchasing / Procurement', 'مطعم / تقديم الطعام / مطبخ':'Restaurant / Catering / Cuisine', 'الموارد البشرية':'Human Resources',
      'الموضة والجمال':'Fashion and Beauty', 'السينما والتصوير الفوتوغرافي / صوت / موسيقى':'Film and Photography / Sound / Music', 'الهيئة الهندسية / مدني / هندسة معمارية':'Engineering - Construction / Civil / Architecture', 'تصميم داخلي / زخرفة':'Interior Design / Decoration', 'هندسة - اخرى':'Engineering - Other', 'هندسة - اتصالات / اتصالات':'Engineering - Telecom / Technology', 'الهندسة الميكانيكية / الكهرباء':'Engineering - Mechanical / Electrical / Medical', 'الهندسة - النفط والغاز / الطاقة':'Engineering - Oil & Gas / Energy', 'C-Level تنفيذي / GM / مخرج':'C-Level Executive / GM / Director', 'دعم نفسي / خدمات المجتمع':'Psychological Support / Community Services', 'اخرى':'Other',
      'خارج شبكة الانترنت': 'OffLine', 'عبر شبكة الانترنت':'OnLine',
      'دوام كامل':'Full Time', 'دوام جزئي':'Part Time',
      'دمشق': 'Damascus', 'ريف دمشق': 'Rif Damascus', 'حمص': 'Homs', 'حلب': 'Aleppo', 'طرطوس': 'Tartus', 'اللاذقية': 'Latakia', 'حماه': 'Hama', 'السويداء': 'Al-Suwayda', 'درعا': 'Daraa', 'دير الزور': 'Deir El-Zor', 'الحسكة': 'Al-Hasakah', 'إدلب': 'Idlib', 'الرقة': 'Al-Raqqah', 'القنيطرة': 'Quneitra',
      'عاطل عن العمل':'Unemployed', 'يعمل':'Working',
    };

    final Map<String, String> englishToArabic = {
      'Administration / Operations / Management': 'إدارة / عمليات', 'Data Entry / Archiving': 'إدخال بيانات / الأرشفة', 'Strategy / Consulting': 'تخطيط / مستشار', 'Research and Development / Statistics / Analyst': 'البحث والتطوير / إحصائيات / المحلل', 'IT / Software Development': 'IT / تطوير البرمجيات', 'Banking / Insurance': 'الخدمات المصرفية / تأمين', 'House Keeping / Office Boys / Porters': 'التدبير المنزلي / ساعي المكتب / بواب', 'Translation / Writing / Editorial': 'ترجمة / كتابة / تحرير', 'Marketing / PR / Advertising': 'تسويق / PR / دعاية', 'Graphic Design / Animation / Art': 'التصميم الجرافيكي / الرسوم المتحركة / الفن',
      'Education / Teaching / Training' : 'تعليم / تدريس / تدريب', 'Social Media / Journalism / Publishing': 'وسائل التواصل الأجتماعي / الصحافة / نشر', 'Quality' : 'الجودة', 'Safety / Guard Services' : 'أمان / خدمات الحراسة', 'Customer Service / Support' : 'خدمة الزبائن / الدعم', 'Manufacturing / Production': 'تصنيع / إنتاج', 'Sport / Nutrition / Physiotherapy': 'رياضة / تغذية / العلاج الطبيعي', 'Farming and Agriculture' :'الزراعة', 'Drivers / Delivery': 'سائق / توصيل طلبات', 'Secretarial / Receptionist': 'سكرتارية / موظف الإستقبال', 'Tourism / Travel / Hotels':'السياحة / السفر / الفنادق', 'Pharmaceutical': 'الادوية',
      'Medical / Healthcare / Nursing': 'الطب / الرعاية الصحية / التمريض', 'Dentists / Prosthodontics':'طب الأسنان / التركيبات', 'Technician / Workers':'فني / عامل', 'Legal / Contracts':'قانون / عقد', 'Chemistry / Laboratories':'كيمياء / مختبرات', 'Logistics / Warehouse / Supply Chain':'الخدمات اللوجستية / مستودع / الموردين', 'Sales / Retail / Distribution':'مبيعات / بيع بالتجزئة / توزيع', 'Accounting / Finance':'محاسبة / تمويل', 'Project / Program Management':'مشروع / إدارة البرنامج','Purchasing / Procurement':'شراء / تحصيل', 'Restaurant / Catering / Cuisine':'مطعم / تقديم الطعام / مطبخ', 'Human Resources':'الموارد البشرية',
      'Fashion and Beauty':'الموضة والجمال', 'Film and Photography / Sound / Music':'السينما والتصوير الفوتوغرافي / صوت / موسيقى', 'Engineering - Construction / Civil / Architecture':'الهيئة الهندسية / مدني / هندسة معمارية', 'Interior Design / Decoration':'تصميم داخلي / زخرفة', 'Engineering - Other':'هندسة - اخرى', 'Engineering - Telecom / Technology':'هندسة - اتصالات / اتصالات', 'Engineering - Mechanical / Electrical / Medical':'الهندسة الميكانيكية / الكهرباء', 'Engineering - Oil & Gas / Energy':'الهندسة - النفط والغاز / الطاقة', 'C-Level Executive / GM / Director':'C-Level تنفيذي / GM / مخرج', 'Psychological Support / Community Services':'دعم نفسي / خدمات المجتمع', 'Other':'اخرى',
      'OffLine':'خارج شبكة الانترنت', 'OnLine':'عبر شبكة الانترنت',
      'Full Time':'دوام كامل', 'Part Time':'دوام جزئي',
      'Damascus': 'دمشق', 'Rif Damascus': 'ريف دمشق', 'Homs': 'حمص', 'Aleppo': 'حلب', 'Tartus': 'طرطوس', 'Latakia': 'اللاذقية', 'Hama': 'حماه', 'Al-Suwayda': 'السويداء', 'Daraa': 'درعا', 'Deir El-Zor': 'دير الزور', 'Al-Hasakah': 'الحسكة', 'Idlib': 'إدلب', 'Al-Raqqah': 'الرقة', 'Quneitra': 'القنيطرة',
      'Unemployed':'عاطل عن العمل', 'Working':'يعمل',
    };

    if (Get.locale?.languageCode == 'ar') {
      return englishToArabic[value] ?? value;
    } else {
      return arabicToEnglish[value] ?? value;
    }
  }

}