import 'package:flutter/material.dart';
import 'package:get/get.dart';

const primaryGreenColor = Color(0xFF85D15C);
const secondaryGreenColor = Color(0xFFB1FC87);
const orangeColor = Color(0xFFF3AD44);
const primaryBlackColor = Color(0xFF1E1E1E);
const primaryWhiteColor = Colors.white;
const secondaryBlackColor = Color(0xFF313131);
const secondaryWhiteColor = Color(0xFFE5E8EF);

// Governorate
List<String> governorateItems = [
  'damascus'.tr,
  'rif damascus'.tr,
  'homs'.tr,
  'aleppo'.tr,
  'tartus'.tr,
  'latakia'.tr,
  'hama'.tr,
  'as-suwayda'.tr,
  'daraa'.tr,
  'deir ez-zor'.tr,
  'al-hasakah'.tr,
  'idlib'.tr,
  'ar-raqqah'.tr,
  'quneitra'.tr
];

// Family State
List familyStateItems = [
  'single'.tr,
  'married'.tr,
  'engaged'.tr,
  'widower'.tr,
  'absolute'.tr,
];

// Nationality
List nationalityItems = [
  'syrian'.tr,
  'palestinian'.tr,
  'Iraqian'.tr,
  'Other'.tr,
];

// Experience Years
List<String> experienceYearsItems = [
  'none'.tr,
  '1year'.tr,
  '2years'.tr,
  '3years'.tr,
  '4years'.tr,
  '5years'.tr,
  '6years'.tr,
  '7years'.tr,
  '8years'.tr,
  '9years'.tr,
  '10years'.tr,
  'more than 10 years'.tr
];

// Education
List educationItems = [
  'none'.tr,
  'high school'.tr,
  'institutional degree'.tr,
  'bachelor degree'.tr,
  'diploma'.tr,
  'master degree'.tr,
  'Doctorate'.tr,
];

// Military Services
List militaryServicesItems = [
  'exempt'.tr,
  'finished'.tr,
  'in service'.tr,
  'postponed'.tr,
];

// Topic
List<String> topicItems = [
  'administration/operations/management'.tr, 'data entry/archiving'.tr, 'strategy/consulting'.tr, 'research and development/statistics/analyst'.tr, 'it/software development'.tr,
  'banking/insurance'.tr, 'house keeping/office boys/porters'.tr, 'translation/writing/editorial'.tr, 'marketing/pr/advertising'.tr, 'graphic design/animation/art'.tr,
  'education/teaching/training'.tr, 'social media/journalism/publishing'.tr, 'quality'.tr, 'safety/guard services'.tr, 'customer service/support'.tr,
  'manufacturing/production'.tr, 'sport/nutrition/physiotherapy'.tr, 'farming and agriculture'.tr, 'drivers/delivery'.tr, 'secretarial/receptionist'.tr,
  'tourism/travel/hotels'.tr, 'pharmaceutical'.tr, 'medical/healthcare/nursing'.tr, 'dentists/prosthodontics'.tr, 'technician/workers'.tr,
  'legal/contracts'.tr, 'chemistry/laboratories'.tr, 'logistics/warehouse/supply chain'.tr, 'sales/retail/distribution'.tr, 'accounting/finance'.tr,
  'project/program management'.tr, 'purchasing/procurement'.tr, 'restaurant/catering/cuisine'.tr, 'human resources'.tr, 'fashion and beauty'.tr,
  'film and photography/sound/music'.tr, 'engineering - construction/civil/architecture'.tr, 'interior design/decoration'.tr, 'engineering - other'.tr, 'engineering - telecom/technology'.tr,
  'engineering - mechanical/electrical/medical'.tr, 'engineering - oil & gas/energy'.tr, 'c-level executive/gm/director'.tr, 'psychological support/community services'.tr, 'other'.tr,
];

// Job Environment
List<String> jobEnvironmentItems = [
  'offline'.tr,
  'online'.tr,
];

// Job Time
List<String> jobTimeItems = [
  'full time'.tr,
  'part time'.tr,
];

// Current Job
List currentJobItems = [
  'unemployed'.tr,
  'working'.tr,
];

// Languages
List<String> languagesItems = [
  'arabic'.tr,
  'english'.tr,
  'german'.tr,
  'french'.tr,
  'spanish'.tr,
  'russian'.tr,
  'other'.tr,
];