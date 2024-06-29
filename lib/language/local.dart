import 'package:get/get.dart';
import 'en.dart' as en;
import 'ar.dart' as ar;

class MyLocal implements Translations {

  @override
  Map<String, Map<String,String>> get keys => {
    'en': en.englishTranslations,
    'ar': ar.arabicTranslations,
  };
}