import 'package:get/get.dart';
import 'package:graduation_project/model/getConsultationModel.dart';
import 'package:graduation_project/modules/apply-consultation/getTopicService.dart';
import 'package:graduation_project/modules/consultation/getConsultatiomService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class ConsultationController extends GetxController {
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;
  late GetTopicService getTopicService;

  // topic
  List<String> userTopicItems = [];
  final selectTopic = "".obs;
  void setSelectedTopic(String value) {
    selectTopic.value = value;
    print('Selected Topic Updated: ${selectTopic.value}');
    // Call getConsultation after setting the selected topic
    getConsultation();
  }

  // Get Consultation
  late GetConsultationService getService;
  var getConsultationStatus = false;
  var userConsultation = [].obs;

  @override
  void onInit() {
    getTopicService = GetTopicService();
    getService = GetConsultationService();
    initializeConsultation();
    super.onInit();
  }

  // Initialize consultation data
  void initializeConsultation() async {
    await getTopic();
    // After getting the topic, set the initial selected topic
    setSelectedTopic(userTopicItems.isNotEmpty ? userTopicItems.first : "");
  }

  // For Get Topics API
  Future<void> getTopic() async {
    isLoading.value = true;
    var token = await storage.read("token");

    var getTopic = await getTopicService.getTopic(token!);

    if (getTopic != null) {
      // Remove duplicates from the topics fetched
      userTopicItems = getTopic.topics.toSet().toList();
    }

    isLoading.value = false;
    print('Topics:' + userTopicItems.toString());
  }

  // For Get Consultation
  Future<void> getConsultation() async {
    isLoading.value = true;
    String selectedTopic = selectTopic.value;

    var token = await storage.read("token");
    print(token);
    try {
      GetConsultationModel getConsultationModel = GetConsultationModel(
        topic: selectedTopic, // Set the selected topic
      );
      var consultation = await getService.displayUserConsultation(
          token, getConsultationModel);
      userConsultation.value = consultation; // Assign the response directly to userConsultation
    } catch (e) {
      print('Error get consultations: $e');
    }

    isLoading.value = false;
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

}