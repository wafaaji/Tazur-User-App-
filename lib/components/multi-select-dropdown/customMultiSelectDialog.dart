import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/constants.dart';

class CustomMultiSelectDialog extends StatelessWidget {
  final String title;
  final Widget widget;
  final List<String> items;
  final List<String> selectedItems;
  final void Function(List<String>) onSelect;
  final bool applyCondition;

  CustomMultiSelectDialog({
    required this.title,
    this.widget = const SizedBox(),
    required this.items,
    required this.selectedItems,
    required this.onSelect,
    this.applyCondition = false,
  });

  @override
  Widget build(BuildContext context) {
    void select() {
      Get.back(result: selectedItems);
    }

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      title: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        color: primaryGreenColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: title,
              color: primaryBlackColor,
              fontSize: 22,
            ),
            widget,
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: items.map(
                (item) {
              bool isSelected = selectedItems.contains(item);
              return CheckboxListTile(
                value: isSelected,
                title: CustomText(
                  text: item,
                  color: isSelected ? primaryGreenColor : primaryBlackColor,
                  fontSize: 16,
                ),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: selectedItems.contains(item) ? primaryWhiteColor : null,
                fillColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return primaryGreenColor;
                    }
                    return null;
                  },
                ),
                onChanged: applyCondition
                    ? (isChecked) {
                  if (isChecked != null) {
                    if (isChecked) {
                      if (selectedItems.length < 7) {
                        selectedItems.add(item);
                      }
                    } else {
                      selectedItems.remove(item);
                    }
                    onSelect(selectedItems);
                  }
                }
                    : (isChecked) {
                  if (isChecked != null) {
                    if (isChecked) {
                      selectedItems.add(item);
                    } else {
                      selectedItems.remove(item);
                    }
                    onSelect(selectedItems);
                  }
                },
              );
            },
          ).toList(),
        ),
      ),
      actions: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: CustomElevatedButton(
              onPressed: select,
              text: 'select button'.tr,
            ),
          ),
        ),
      ],
    );
  }
}
