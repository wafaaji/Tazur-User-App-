import 'package:flutter/material.dart';
import 'package:graduation_project/components/customCircleAvatar.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class DrawerBuildHeader extends StatelessWidget {
  final String urlImage;
  final String name;
  final String email;

  DrawerBuildHeader({
    required this.urlImage,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCircleAvatar(
            radius: 30,
            //backgroundImage: AssetImage(urlImage),
            imagePath: urlImage,
            color: primaryWhiteColor,
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: name,
                fontSize: 20,
                color: primaryWhiteColor,
              ),
              SizedBox(
                height: 4,
              ),
              CustomText(
                text: email,
                fontSize: 14,
                color: primaryWhiteColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
