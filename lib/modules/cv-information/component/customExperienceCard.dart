import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/cv-information/cvInformationController.dart';

class CustomExperienceCard extends StatelessWidget {
  final CVInformationController controller = Get.put(CVInformationController());

  @override
  Widget build(BuildContext context) {
    if (controller.experiences.isEmpty) {
      return Container(); // or a placeholder widget
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.experiences.length,
          itemBuilder: (context, index) {
            var experience = controller.experiences[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed('/updateExperience', arguments: {'experienceId': experience['id']});
              },
              child: Container(
                width: MediaQuery.of(context).size.height * 0.15,
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: secondaryWhiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: secondaryWhiteColor.withOpacity(0.50),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      child: Column(
                        children: [
                          CustomText(
                            text: experience['name'],
                            color: primaryBlackColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomText(
                            text: experience['start_date'],
                            color: primaryBlackColor,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          CustomText(
                            text: experience['end_date'],
                            color: primaryBlackColor,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}