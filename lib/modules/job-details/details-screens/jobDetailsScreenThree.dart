import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/model/questionModel.dart';
import 'package:graduation_project/modules/job-details/jobDetailsController.dart';

class JobDetailsScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobDetailsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: CustomText(
              text: 'questions'.tr,
              color: primaryGreenColor,
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          body: Obx(() {
            if (controller.isLoading.isTrue) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryGreenColor,
                ),
              );
            }

            if (controller.QuestionsList.isEmpty) {
              return Center(
                child: CustomText(
                  text: 'no questions'.tr,
                  color: primaryBlackColor,
                  fontSize: 18.0,
                ),
              );
            }

            return ListView.builder(
              itemCount: controller.QuestionsList.length,
              itemBuilder: (context, index) {
                QuestionModel questionModel = controller.QuestionsList[index];
                List<Option> options = questionModel.options;
                String question = questionModel.question;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: primaryBlackColor, width: 1.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: secondaryWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(minWidth: 300),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: question,
                              color: primaryBlackColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(options.length, (answerIndex) {
                                final isSelected = controller.selectedAnswers[questionModel.id] == options[answerIndex].id;
                                return GestureDetector(
                                  onTap: () {
                                    controller.updateSelectedAnswer(
                                      questionModel.id,
                                      options[answerIndex].id,
                                    );
                                  },
                                  child: Obx(() {
                                    // Wrap this Container with Obx to react to state changes
                                    final isSelected = controller.selectedAnswers[questionModel.id] == options[answerIndex].id;
                                    return Container(
                                      padding: EdgeInsets.all(10.0),
                                      margin: EdgeInsets.only(top: 10.0),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? primaryGreenColor.withOpacity(0.3)
                                            : primaryWhiteColor,
                                        border: Border.all(
                                          color: primaryBlackColor.withOpacity(0.50),
                                        ),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: CustomText(
                                        text: options[answerIndex].optionText.toString(),
                                        fontSize: 16.0,
                                        color: primaryBlackColor,
                                      ),
                                    );
                                  }),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        );
      },
    );
  }
}