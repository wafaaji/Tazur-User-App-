import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/cv-information/cvInformationController.dart';

class CustomReferenceCard extends StatelessWidget {
  final CVInformationController controller = Get.put(CVInformationController());

  @override
  Widget build(BuildContext context) {
    if (controller.reference.isEmpty) {
      return Container(); // or a placeholder widget
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.reference.length,
          itemBuilder: (context, index) {
            var reference = controller.reference[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed('/updateReference', arguments: {'referenceId': reference['id']});
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
                            text: reference['name'],
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
                            text: reference['phone'],
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
