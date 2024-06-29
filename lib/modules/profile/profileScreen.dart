import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/profile/component/customProfileButtons.dart';
import 'package:graduation_project/modules/profile/component/customProfileCards.dart';
import 'package:graduation_project/modules/profile/profileController.dart';

class ProfileScreen extends StatelessWidget {
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final profile = controller.profile.value;
        if (profile == null) {
          return Center(
            child: CircularProgressIndicator(
              color: primaryGreenColor,
            ),
          );
        }

        print('Profile image URL: ${profile.image}'); // Debugging line

        ImageProvider imageProvider;
        if (profile.image != null &&
            profile.image!.isNotEmpty &&
            profile.image != "http://86.38.218.161:8080/") {
          imageProvider = NetworkImage(profile.image!);
        } else {
          imageProvider = AssetImage('assets/images/profile.jpg');
        }

        return Container(
          color: secondaryWhiteColor,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              CircleAvatar(
                backgroundImage: imageProvider,
                radius: 65,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: '${profile.firstName}  ${profile.lastName}',
                color: primaryBlackColor,
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: profile.email,
                color: primaryBlackColor.withOpacity(0.50),
                fontSize: 16.0,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomProfileCards(),
              CustomProfileButtons(
                uploadOnPressed: () {
                  controller.onClickUpdate();
                },
                downloadOnPressed: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
            ],
          ),
        );
      }),
    );
  }
}
