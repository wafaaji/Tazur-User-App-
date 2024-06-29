import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/all-jobs/allJobsScreen.dart';
import 'package:graduation_project/modules/consultation/consultationScreen.dart';
import 'package:graduation_project/modules/courses/coursesScreen.dart';
import 'package:graduation_project/modules/drawer/drawerScreen.dart';
import 'package:graduation_project/modules/home/homeController.dart';
import 'package:graduation_project/modules/my-jobs/myJobsScreen.dart';
import 'package:graduation_project/modules/profile/profileScreen.dart';

class HomeScreen extends StatelessWidget{
  HomeController controller = Get.put(HomeController());
  final screens = [
    ConsultationScreen(),
    AllJobsScreen(),
    MyJobsScreen(),
    CoursesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: primaryGreenColor,
        iconTheme: IconThemeData(color: primaryWhiteColor, size: 35),
        title: CustomText(
            text: 'tazzur'.tr,
            color: primaryWhiteColor,
            fontSize: 30,
          ),
        centerTitle: true,
        titleSpacing: NavigationToolbar.kMiddleSpacing,
      ),
      body: Obx((){
        return IndexedStack(
          children: screens,
          index: controller.selectedIndex.value,
        );
      }),
      bottomNavigationBar: StyleProvider(
        style: Style(),
        child: ConvexAppBar(
          activeColor: primaryWhiteColor,
          backgroundColor: primaryGreenColor,
          color: secondaryWhiteColor,
          style: TabStyle.flip,
          curve: Curves.easeInOut,
          elevation: 10,
          items: [
            TabItem(
              icon: Icons.chat_outlined,
              title: 'consultation'.tr,
            ),
            TabItem(
              icon: Icons.work_outline_outlined,
              title: 'all jobs'.tr,
              activeIcon: Icons.home_repair_service_rounded
            ),
            TabItem(
              icon: Icons.home_outlined,
              title: 'my jobs'.tr,
              activeIcon: Icons.home
            ),
            TabItem(
              icon: Icons.library_books_outlined,
              title: 'courses'.tr,
              activeIcon: Icons.my_library_books_rounded
            ),
            TabItem(
              icon: Icons.person_outline_outlined,
              title: 'profile'.tr,
              activeIcon: Icons.person
            ),
          ],
          onTap: (index){
            controller.changeIndex(index);
          },
          initialActiveIndex: controller.selectedIndex.value,
        ),
      ),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 35;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 25;

  @override
  TextStyle textStyle(Color color, String? selectedContent) {
    return TextStyle(fontSize: 12, color: color);
  }
}