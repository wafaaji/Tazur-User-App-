import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/model/sendConsultationModel.dart';
import 'package:graduation_project/modules/apply-consultation/getTopicService.dart';
import 'package:graduation_project/modules/apply-consultation/sendConsultationService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class ApplyConsultationController extends GetxController{
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;
  late GetTopicService getTopicService;

  // topic
  List<String> userTopicItems = [];
  final selectTopic = "".obs;
  void setSelectedTopic(String value) {
    selectTopic.value = value;
  }

  // Message
  late TextEditingController consultationController;
  var consultation = '';
  late SendConsultationService sendService;
  var sendConsultationStatus = false;
  var message;

  @override
  void onInit() {
    consultationController = TextEditingController();
    getTopicService = GetTopicService();
    getTopic();

    sendService = SendConsultationService();
    super.onInit();
  }

  @override
  void onClose() {
    consultationController.dispose();
    super.onClose();
  }

  // For Get Topics API
  void getTopic() async {
    isLoading.value = true;
    var token = await storage.read("token");

    var getTopic = await getTopicService.getTopic(token!);

    if (getTopic != null) {
      // Remove duplicates from the topics fetched
      userTopicItems = getTopic.topics.toSet().toList();
      // Ensure the selected topic is still valid
      if (!userTopicItems.contains(selectTopic.value)) {
        selectTopic.value = userTopicItems.isNotEmpty ? userTopicItems.first : "";
      }
    }

    isLoading.value = false;
    print('Topics:' + userTopicItems.toString());
  }

  String translateValue(String value) {
    final Map<String, String> arabicToEnglish = {
      'إدارة / عمليات': 'Administration / Operations / Management', 'إدخال بيانات / الأرشفة': 'Data Entry / Archiving', 'تخطيط / مستشار': 'Strategy / Consulting', 'البحث والتطوير / إحصائيات / المحلل': 'Research and Development / Statistics / Analyst', 'IT / تطوير البرمجيات': 'IT / Software Development', 'الخدمات المصرفية / تأمين': 'Banking / Insurance', 'التدبير المنزلي / ساعي المكتب / بواب': 'House Keeping / Office Boys / Porters', 'ترجمة / كتابة / تحرير': 'Translation / Writing / Editorial', 'تسويق / PR / دعاية': 'Marketing / PR / Advertising', 'التصميم الجرافيكي / الرسوم المتحركة / الفن': 'Graphic Design / Animation / Art',
      'تعليم / تدريس / تدريب' : 'Education / Teaching / Training', 'وسائل التواصل الأجتماعي / الصحافة / نشر' : 'Social Media / Journalism / Publishing', 'الجودة': 'Quality', 'أمان / خدمات الحراسة' : 'Safety / Guard Services', 'خدمة الزبائن / الدعم': 'Customer Service / Support', 'تصنيع / إنتاج': 'Manufacturing / Production','رياضة / تغذية / العلاج الطبيعي':'Sport / Nutrition / Physiotherapy', 'الزراعة': 'Farming and Agriculture', 'سائق / توصيل طلبات': 'Drivers / Delivery', 'سكرتارية / موظف الإستقبال': 'Secretarial / Receptionist', 'السياحة / السفر / الفنادق': 'Tourism / Travel / Hotels', 'الادوية' : 'Pharmaceutical',
      'الطب / الرعاية الصحية / التمريض' : 'Medical / Healthcare / Nursing', 'طب الأسنان / التركيبات':'Dentists / Prosthodontics', 'فني / عامل':'Technician / Workers', 'قانون / عقد':'Legal / Contracts', 'كيمياء / مختبرات':'Chemistry / Laboratories', 'الخدمات اللوجستية / مستودع / الموردين':'Logistics / Warehouse / Supply Chain', 'مبيعات / بيع بالتجزئة / توزيع':'Sales / Retail / Distribution', 'محاسبة / تمويل':'Accounting / Finance', 'مشروع / إدارة البرنامج':'Project / Program Management', 'شراء / تحصيل':'Purchasing / Procurement', 'مطعم / تقديم الطعام / مطبخ':'Restaurant / Catering / Cuisine', 'الموارد البشرية':'Human Resources',
      'الموضة والجمال':'Fashion and Beauty', 'السينما والتصوير الفوتوغرافي / صوت / موسيقى':'Film and Photography / Sound / Music', 'الهيئة الهندسية / مدني / هندسة معمارية':'Engineering - Construction / Civil / Architecture', 'تصميم داخلي / زخرفة':'Interior Design / Decoration', 'هندسة - اخرى':'Engineering - Other', 'هندسة - اتصالات / اتصالات':'Engineering - Telecom / Technology', 'الهندسة الميكانيكية / الكهرباء':'Engineering - Mechanical / Electrical / Medical', 'الهندسة - النفط والغاز / الطاقة':'Engineering - Oil & Gas / Energy', 'C-Level تنفيذي / GM / مخرج':'C-Level Executive / GM / Director', 'دعم نفسي / خدمات المجتمع':'Psychological Support / Community Services', 'اخرى':'Other',
    };

    final Map<String, String> englishToArabic = {
      'Administration / Operations / Management': 'إدارة / عمليات', 'Data Entry / Archiving': 'إدخال بيانات / الأرشفة', 'Strategy / Consulting': 'تخطيط / مستشار', 'Research and Development / Statistics / Analyst': 'البحث والتطوير / إحصائيات / المحلل', 'IT / Software Development': 'IT / تطوير البرمجيات', 'Banking / Insurance': 'الخدمات المصرفية / تأمين', 'House Keeping / Office Boys / Porters': 'التدبير المنزلي / ساعي المكتب / بواب', 'Translation / Writing / Editorial': 'ترجمة / كتابة / تحرير', 'Marketing / PR / Advertising': 'تسويق / PR / دعاية', 'Graphic Design / Animation / Art': 'التصميم الجرافيكي / الرسوم المتحركة / الفن',
      'Education / Teaching / Training' : 'تعليم / تدريس / تدريب', 'Social Media / Journalism / Publishing': 'وسائل التواصل الأجتماعي / الصحافة / نشر', 'Quality' : 'الجودة', 'Safety / Guard Services' : 'أمان / خدمات الحراسة', 'Customer Service / Support' : 'خدمة الزبائن / الدعم', 'Manufacturing / Production': 'تصنيع / إنتاج', 'Sport / Nutrition / Physiotherapy': 'رياضة / تغذية / العلاج الطبيعي', 'Farming and Agriculture' :'الزراعة', 'Drivers / Delivery': 'سائق / توصيل طلبات', 'Secretarial / Receptionist': 'سكرتارية / موظف الإستقبال', 'Tourism / Travel / Hotels':'السياحة / السفر / الفنادق', 'Pharmaceutical': 'الادوية',
      'Medical / Healthcare / Nursing': 'الطب / الرعاية الصحية / التمريض', 'Dentists / Prosthodontics':'طب الأسنان / التركيبات', 'Technician / Workers':'فني / عامل', 'Legal / Contracts':'قانون / عقد', 'Chemistry / Laboratories':'كيمياء / مختبرات', 'Logistics / Warehouse / Supply Chain':'الخدمات اللوجستية / مستودع / الموردين', 'Sales / Retail / Distribution':'مبيعات / بيع بالتجزئة / توزيع', 'Accounting / Finance':'محاسبة / تمويل', 'Project / Program Management':'مشروع / إدارة البرنامج','Purchasing / Procurement':'شراء / تحصيل', 'Restaurant / Catering / Cuisine':'مطعم / تقديم الطعام / مطبخ', 'Human Resources':'الموارد البشرية',
      'Fashion and Beauty':'الموضة والجمال', 'Film and Photography / Sound / Music':'السينما والتصوير الفوتوغرافي / صوت / موسيقى', 'Engineering - Construction / Civil / Architecture':'الهيئة الهندسية / مدني / هندسة معمارية', 'Interior Design / Decoration':'تصميم داخلي / زخرفة', 'Engineering - Other':'هندسة - اخرى', 'Engineering - Telecom / Technology':'هندسة - اتصالات / اتصالات', 'Engineering - Mechanical / Electrical / Medical':'الهندسة الميكانيكية / الكهرباء', 'Engineering - Oil & Gas / Energy':'الهندسة - النفط والغاز / الطاقة', 'C-Level Executive / GM / Director':'C-Level تنفيذي / GM / مخرج', 'Psychological Support / Community Services':'دعم نفسي / خدمات المجتمع', 'Other':'اخرى',
    };

    if (Get.locale?.languageCode == 'ar') {
      return englishToArabic[value] ?? value;
    } else {
      return arabicToEnglish[value] ?? value;
    }
  }

  // For Interested API
  Future<void> sendOnClick() async {
    String selectedTopic = selectTopic.value;
    consultation = consultationController.text;
    try {
      var token = await storage.read("token");
      SendConsultationModel sendConsultation = SendConsultationModel(
        consulution: Consulution(
          userMessage: consultation,
          topic: selectedTopic, // Set the selected topic
        ),
      );

      sendConsultationStatus =
      await sendService.SendConsultation(token, sendConsultation);
      message = sendService.message;

      if (message is List) {
        String temp = '';
        for (String s in message)
          temp += s + "\n";
        message = temp;
      }
    } catch (e) {
      print("Error Send Consultation: $e");
      message = 'Error send consultation: $e'.tr;
    }
  }

}