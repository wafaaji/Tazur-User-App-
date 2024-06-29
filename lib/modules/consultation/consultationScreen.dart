import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/consultation/consultationController.dart';
import 'package:graduation_project/components/CustomNoResult.dart';

class ConsultationScreen extends StatelessWidget {
  final ConsultationController controller = Get.put(ConsultationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryWhiteColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() {
              return Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: primaryGreenColor,
                ),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,
                    child: SingleChildScrollView( // Wrap the DropdownButton with SingleChildScrollView
                      scrollDirection: Axis.horizontal,
                      // Set the scrolling direction to horizontal
                      child: DropdownButton<String>(
                        value: controller.selectTopic.value,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.setSelectedTopic(newValue);
                          }
                        },
                        items: controller.userTopicItems.map((String topic) {
                          return DropdownMenuItem<String>(
                            value: topic,
                            child: Text(controller.translateValue(topic)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryGreenColor,
                ),
              );
            } else {
              if (controller.userConsultation.isEmpty) {
                return RefreshIndicator(
                  onRefresh: () async {
                    await controller.getConsultation();
                  },
                  color: primaryGreenColor,
                  child: CustomNoResult(
                      text: 'no consultation'.tr,
                    ),
                );
              } else {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await controller.getConsultation();
                      },
                      color: primaryGreenColor,
                      child: ListView.builder(
                        itemCount: controller.userConsultation.length,
                        itemBuilder: (context, index) {
                          var consultation = controller.userConsultation[index];
                          return Column(
                            children: [
                              // User Message
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    // width: MediaQuery.of(context).size.width * 0.8,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 20,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: primaryGreenColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40),
                                      ),
                                    ),
                                    child: CustomText(
                                      text: consultation.userMessage ?? "",
                                      color: primaryBlackColor,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                              // Advisor Message
                              consultation.advisorReply == null ?
                               SizedBox() :
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: primaryWhiteColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(40),
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40),
                                      ),
                                    ),
                                    child: CustomText(
                                      text: consultation.advisorReply ?? "",
                                      color: primaryBlackColor,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                );
              }
            }
          }),
          SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }
}
