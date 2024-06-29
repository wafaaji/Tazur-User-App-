import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/drawer/component/drawerBuildHeader.dart';
import 'package:graduation_project/modules/drawer/component/drawerBuildMenuItem.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final name = 'Park Jimin';
    final email = 'jimin@jmail.com';
    final urlImage = 'assets/images/PIN code.png';
    return Drawer(
      child: Material(
        color: primaryGreenColor,
        child: ListView(
          children: [
            DrawerBuildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  DrawerBuildMenuItem(
                      urlImg: 'assets/icons/drawer-icons/apply consultation.png',
                      text: 'apply consultation'.tr,
                      onClicked: () => selectedItem(context, 0),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  DrawerBuildMenuItem(
                      urlImg: 'assets/icons/drawer-icons/poll.png',
                      text: 'surveys'.tr,
                      onClicked: () => selectedItem(context, 1),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  DrawerBuildMenuItem(
                      urlImg: 'assets/icons/drawer-icons/companies.png',
                      text: 'companies'.tr,
                      onClicked: () => selectedItem(context, 2),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  DrawerBuildMenuItem(
                      urlImg: 'assets/icons/drawer-icons/notification.png',
                      text: 'notification'.tr,
                      onClicked: () => selectedItem(context, 3),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Divider(
                    color: primaryWhiteColor,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  DrawerBuildMenuItem(
                      urlImg: 'assets/icons/drawer-icons/settings.png',
                      text: 'settings'.tr,
                      onClicked: () => selectedItem(context, 4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Get.back();
    switch (index) {
      case 0:
        Get.toNamed('/applyConsultationDefinition');
        break;
      case 1:
        Get.toNamed('/surveys');
        break;
      case 2:
        Get.toNamed('/companies');
        break;
      case 3:
        Get.toNamed('/notification');
        break;
      case 4:
        Get.toNamed('/settings');
        break;
    }
  }
}
