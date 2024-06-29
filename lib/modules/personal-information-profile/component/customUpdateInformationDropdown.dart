import 'package:flutter/material.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class CustomUpdateInformationDropdown extends StatelessWidget {
  final String title;
  final List<dynamic> items;
  final dynamic value;
  final Function(String?)? onChanged;

  CustomUpdateInformationDropdown({
    required this.title,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Convert items to a set to remove duplicates
    List<dynamic> uniqueItems = items.toSet().toList();
    print("Dropdown Items: $items");

    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: primaryGreenColor,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                color: primaryBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                decoration: BoxDecoration(
                  color: secondaryWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width * 0.85,
                height: 48,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: DropdownButtonFormField<String>(
                    value: value ?? '',
                    onChanged: onChanged,
                    items: uniqueItems.map((item) {
                      return DropdownMenuItem<String>(
                        value: item.toString(),
                        child: Text(item.toString()),
                      );
                    }).toList(),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    isExpanded: true,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      color: primaryBlackColor,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none, // Remove underline
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
