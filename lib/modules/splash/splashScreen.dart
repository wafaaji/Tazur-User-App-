import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/components/customAssetImage.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/splash/splashController.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [primaryWhiteColor,secondaryWhiteColor]
          ),
        ),
        alignment: Alignment.center,
        child: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAssetImage(
                  imagePath: 'assets/images/auth.png'
              ),
              CustomText(
                text: 'User Application',
                color: primaryGreenColor,
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                child:CircularProgressIndicator(
                  color: primaryGreenColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
