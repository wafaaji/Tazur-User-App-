import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/modules/profile/component/customCard.dart';

class CustomProfileCards extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: ListView(
            children: [
              CustomCard(
                leadingIcon:    Icons.person_outline_outlined,
                title: 'personal information'.tr,
                onTap: () {
                  Get.offNamed('/personalInformation');
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomCard(
                leadingIcon: Icons.info_outline,
                title: 'basic information'.tr,
                onTap: () {
                  Get.toNamed('/basicInformation');
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomCard(
                leadingIcon: Icons.business_center_outlined,
                title: 'target job'.tr,
                onTap: () {
                  Get.toNamed('/targetJob');
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomCard(
                leadingIcon: Icons.location_history_outlined,
                title: 'cv information'.tr,
                onTap: () {
                  Get.toNamed('/cvInformation');
                },
              ),
            ],
          )),
    );
  }
}
