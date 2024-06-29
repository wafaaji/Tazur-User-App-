import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAssetImage.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/all-companies/allCompaniesController.dart';

class AllCompaniesSearchFilter extends GetView<AllCompaniesController> {

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 45.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.72,
                  decoration: BoxDecoration(
                    color: secondaryWhiteColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: isArabic? Radius.circular(0) : Radius.circular(30),
                      bottomRight: isArabic? Radius.circular(30) : Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02, right: MediaQuery.of(context).size.width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.searchController,
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              controller.search = value!;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'company search text'.tr,
                              hintStyle: TextStyle(
                                color: primaryBlackColor.withOpacity(0.50),
                                fontFamily: 'Roboto',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                             controller.resetSearch();
                          },
                          child: CustomAssetImage(
                            imagePath: 'assets/icons/close.png',
                            color: primaryBlackColor.withOpacity(0.50),
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.12,
                  decoration: BoxDecoration(
                    color: secondaryGreenColor,
                    borderRadius: BorderRadius.only(
                      topRight: isArabic? Radius.circular(0) : Radius.circular(30),
                      topLeft: isArabic? Radius.circular(30) : Radius.circular(0),
                    ),
                  ),
                  child: IconButton(
                    onPressed: (){
                       controller.fetchSearchData();
                    },
                    icon: Image.asset(
                      'assets/icons/search.png',
                      height: 25.0,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: 45,
              child: IconButton(
                onPressed: (){
                  Get.toNamed('/filter');
                },
                icon: Image.asset(
                  'assets/icons/filter.png',
                  color: primaryGreenColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
