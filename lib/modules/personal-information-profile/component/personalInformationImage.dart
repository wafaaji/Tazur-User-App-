import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/personal-information-profile/personalInformationController.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInformationImage extends StatelessWidget {
  final PersonalInformationController controller =
  Get.put(PersonalInformationController());
  final ImageProvider<Object>? backgroundImage;
  final Key? key; // Add key parameter here

  PersonalInformationImage({
    this.backgroundImage,
    this.key, // Initialize key parameter in the constructor
  });

  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage: backgroundImage,
          radius: 60.0,
        ),
        Positioned(
          bottom: 5,
          left: 90,
          child: InkWell(
            child: Container(
              width: 35.0,
              height: 35.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: primaryWhiteColor,
              ),
              child: Icon(
                Icons.camera,
                color: primaryBlackColor,
              ),
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => bottomSheet(context),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          CustomText(
            text: 'Choose Profile Picture',
            color: primaryBlackColor.withOpacity(0.50),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      color: primaryGreenColor,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    CustomText(
                      text: 'Gallery',
                      color: primaryGreenColor,
                    ),
                  ],
                ),
                onTap: () {
                  getImage(ImageSource.gallery);
                },
              ),
              SizedBox(
                width: size.width * 0.2,
              ),
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera,
                      color: primaryGreenColor,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    CustomText(
                      text: 'Camera',
                      color: primaryGreenColor,
                    ),
                  ],
                ),
                onTap: () {
                  getImage(ImageSource.camera);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> getImage(ImageSource source) async {
    final pickedImage =
    await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    controller.setProfileImagePath(pickedFile!.path);
    Get.back();
  }
}
