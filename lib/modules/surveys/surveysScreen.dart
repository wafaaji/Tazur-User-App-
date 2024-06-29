import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customIconButton.dart';
import 'package:graduation_project/components/customNoResult.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/surveys/component/customSurveyCard.dart';
import 'package:graduation_project/modules/surveys/surveysController.dart';

class SurveysScreen extends StatelessWidget {
  SurveysController controller = Get.put(SurveysController());

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreenColor,
        leading: CustomIconButton(
          onPressed: (){
            Get.offNamed('/home');
          },
          icon: Icons.arrow_back_outlined,
          color: primaryWhiteColor,
        ),
        title: CustomText(
          text: 'surveys'.tr,
          color: primaryWhiteColor,
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Obx((){
          if (controller.isLoading.value && controller.surveys.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color: primaryGreenColor),
            );
          }
          return Column(
            children: [
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo is ScrollEndNotification &&
                        scrollController.position.extentAfter == 0) {
                      controller.onScroll();
                    }
                    return false;
                  },
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await controller.fetchData();
                    },
                    color: primaryGreenColor,
                    child: ListView.builder(
                         controller: scrollController,
                        itemCount: controller.surveys.length + 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                        if (index < controller.surveys.length) {
                        final surveys = controller.surveys[index];
                          return CustomSurveyCard(
                            imagePath: surveys.company.logo,
                            companyName: surveys.company.name,
                            surveyTitle: surveys.title,
                            onPressed: () {
                              Get.toNamed('/surveyDetails', arguments: surveys.id);
                            },
                          );
                        } else {
                          if (controller.isLoading.value) {
                            // Show loading indicator at the end of list
                            return Center(
                              child: Column(
                                children: [
                                  CircularProgressIndicator(color: primaryGreenColor),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              ),
                            );
                          } else if (controller.surveys.isEmpty) {
                            // Show no result message only for search results
                            return CustomNoResult(
                              text: 'no job available'.tr,
                            );
                          } else {
                            // No more data to load
                            return SizedBox();
                          }
                          }
                        }
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
