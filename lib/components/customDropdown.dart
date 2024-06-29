import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';

class CustomDropdown extends StatefulWidget {
  final List<dynamic> items;
  final String value;
  final Function(String)? onChanged;

  CustomDropdown({
    required this.items,
    required this.value,
    this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String _selectedValue;

  @override
  void initState() {
    _selectedValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * 0.75,
      height: 40,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: DropdownButton(
          onChanged: (newValue) {
            setState(() {
              _selectedValue = newValue.toString();
            });
            if (widget.onChanged != null) {
              widget.onChanged!(_selectedValue);
            }
          },
          value: _selectedValue,
          items: widget.items.map((selectedType) {
            return DropdownMenuItem(
              child: Text(
                selectedType,
              ),
              value: selectedType,
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
          underline: Container(),
        ),
      ),
    );
  }
}