import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/custom-card/customCardInformation.dart';
import 'package:graduation_project/components/custom-card/customCompanyInformationCourseCard.dart';
import 'package:graduation_project/components/custom-card/customTitleCard.dart';
import 'package:graduation_project/constants.dart';

class CustomCourseCard extends StatelessWidget {
  final int id;
  final String imgPath;
  final String jobTitle;
  final DateTime createdAt;
  final String topic;
  final String startDate;
  final String days;
  final String courseLocation;
  final String price;
  final String companyName;
  final String companyLocation;
  //final bool hiddenName;

  const CustomCourseCard({
    Key? key,
    required this.id,
    required this.imgPath,
    required this.jobTitle,
    required this.createdAt,
    required this.topic,
    required this.startDate,
    required this.days,
    required this.courseLocation,
    required this.price,
    required this.companyName,
    required this.companyLocation,
    //required this.hiddenName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/courseDetails', arguments: id);
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        color: secondaryWhiteColor,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.0,
            left: 5.0,
            right: 5.0,
          ),
          child: Card(
            elevation: 5.0,
            color: primaryWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomTitleCard(
                    imgPath: imgPath,
                    title: jobTitle,
                    createdAt: createdAt,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      CustomCardInformation(
                        imgPath: 'assets/icons/job-card-icons/topic.png',
                        title: 'topic'.tr,
                        text: topic,
                      ),
                      SizedBox(height: 2.0),
                      CustomCardInformation(
                        imgPath: 'assets/icons/course-card-icons/start date.png',
                        title: 'start date'.tr,
                        text: startDate,
                      ),
                      SizedBox(height: 2.0),
                      CustomCardInformation(
                        imgPath: 'assets/icons/course-card-icons/start date.png',
                        title: 'days'.tr,
                        text: days,
                      ),
                      SizedBox(height: 2.0),
                      CustomCardInformation(
                        imgPath: 'assets/icons/job-card-icons/job location.png',
                        title: 'course location'.tr,
                        text: courseLocation,
                      ),
                      SizedBox(height: 2.0),
                      CustomCardInformation(
                        imgPath: 'assets/icons/course-card-icons/price.png',
                        title: 'price'.tr,
                        text: price,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomCompanyInformationCourseCard(
                    companyName: companyName,
                    companyLocation: companyLocation,
                    //hiddenName: hiddenName,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}