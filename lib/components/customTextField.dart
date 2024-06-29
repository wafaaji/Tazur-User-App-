import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final InputDecoration decoration;
  final String? defaultText;
  final Color hintColor;
  final double hintSize;
  final bool useEnabledBorder;
  final double? height;

  CustomTextField({
    required this.controller,
    required this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.onSaved,
    this.validator,
    required this.decoration,
    this.defaultText,
    this.hintColor = primaryBlackColor,
    this.hintSize = 16,
    this.useEnabledBorder = true,
    this.height,
  }) : assert(obscureText == false || defaultText == null,
  "Cannot set defaultText when obscureText is true.");

  @override
  Widget build(BuildContext context) {

    final isMultiline = keyboardType == TextInputType.multiline;


    if (defaultText != null && controller.text.isEmpty) {
      controller.text = defaultText!;
    }

    return Container(
      height: height,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: secondaryWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            obscureText: obscureText,
            onSaved: onSaved,
            validator: validator,
            decoration: decoration.copyWith(
              hintText: decoration.hintText,
              hintStyle: TextStyle(
                  color: hintColor,
                fontFamily: 'Roboto',
                fontSize: hintSize,
              ),
              enabledBorder: useEnabledBorder ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: primaryBlackColor,
                ),
              ): InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: primaryGreenColor,
                    width: 2.0
                ),
              ),
              contentPadding: isMultiline
                  ? EdgeInsets.symmetric(vertical: 10.0, horizontal: 10)
                  : null,
              alignLabelWithHint: isMultiline,
            ),
            cursorColor: primaryGreenColor,
            maxLines: isMultiline ? null : 1,
          ),

      ),
    );
  }
}
