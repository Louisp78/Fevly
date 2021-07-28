import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.obscureText = false,
    this.isSelected = false,
    required this.onChanged,
    required this.onSaved,
    required this.validator,
    required this.decoration,
    this.width,
    this.height,
  }) : super(key: key);
  final bool isSelected;
  final bool obscureText;
  final Function(String) onChanged;
  final Function(String?) onSaved;
  final String? Function(String?) validator;
  final InputDecoration decoration;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: width ?? size.width * 0.8,
      height: height ?? 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
          onChanged: onChanged,
          validator: validator,
          onSaved: onSaved,
          cursorColor: kPrimaryColor,
          obscureText: obscureText,
          decoration: decoration //basicInputDecoration(textTheme, hintText),
          ),
    );
  }
}
