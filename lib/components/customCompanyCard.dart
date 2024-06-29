import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customCircleAvatar.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class CustomCompanyCard extends StatelessWidget {
  final int id;
  final String imgPath;
  final String companyName;
  final String companyTopic;

  CustomCompanyCard({
    required this.id,
    required this.imgPath,
    required this.companyName,
    required this.companyTopic,

});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: secondaryWhiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCircleAvatar(
                imagePath: imgPath,
                radius: 40.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: companyName,
                      color: primaryBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    CustomText(
                      text: companyTopic,
                      color: primaryBlackColor.withOpacity(0.50),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: CustomElevatedButton(
                  onPressed: (){
                    Get.toNamed('/companyDetails', arguments: id);
                  },
                  text: 'details button'.tr,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
