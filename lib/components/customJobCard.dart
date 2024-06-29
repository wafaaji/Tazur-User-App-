import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/custom-card/customCardInformation.dart';
import 'package:graduation_project/components/custom-card/customCompanyInformationCard.dart';
import 'package:graduation_project/components/custom-card/customTitleCard.dart';
import 'package:graduation_project/constants.dart';

class CustomJobCard extends StatelessWidget {
  final int id;
  final String imgPath;
  final String jobTitle;
  final DateTime createdAt;
  final String topic;
  final String experienceYears;
  final String jobTime;
  final String location;
  final String companyName;
  final String companyLocation;
  final bool hiddenName;

  const CustomJobCard({
    required this.id,
    required this.imgPath,
    required this.jobTitle,
    required this.createdAt,
    required this.topic,
    required this.experienceYears,
    required this.jobTime,
    required this.location,
    required this.companyName,
    required this.companyLocation,
    required this.hiddenName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/jobDetails', arguments: id);
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
                        imgPath: 'assets/icons/job-card-icons/experience.png',
                        title: 'experience'.tr,
                        text: experienceYears,
                      ),
                      SizedBox(height: 2.0),
                      CustomCardInformation(
                        imgPath: 'assets/icons/job-card-icons/job time.png',
                        title: 'job time'.tr,
                        text: jobTime,
                      ),
                      SizedBox(height: 2.0),
                      CustomCardInformation(
                        imgPath: 'assets/icons/job-card-icons/job location.png',
                        title: 'job location'.tr,
                        text: location,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomCompanyInformationCard(
                    companyName: companyName,
                    companyLocation: companyLocation,
                    hiddenName: hiddenName,
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