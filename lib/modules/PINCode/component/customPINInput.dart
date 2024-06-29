import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/constants.dart';

class CustomPinInput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode; // Add focusNode property
  final FocusNode? nextFocusNode;

  const CustomPinInput({
    Key? key,
    required this.controller,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.focusNode, // Initialize focusNode
    this.nextFocusNode, // Initialize nextFocusNode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      focusNode: focusNode,
      onChanged: (value) {
        if (value.length == 1) {
          //nextFocusNode!.requestFocus(); // Move focus to the next field
          FocusScope.of(context).nextFocus();
        }
        onChanged?.call(value);
      },
      onSaved: onSaved,
      validator: validator,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        hintText: '0',
        hintStyle: TextStyle(
          color: primaryBlackColor,
          fontFamily: 'Roboto',
          fontSize: 16.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: primaryBlackColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: primaryGreenColor,
            width: 2.0,
          ),
        ),
      ),
      cursorColor: primaryGreenColor,
    );
  }
}
