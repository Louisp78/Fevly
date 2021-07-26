import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    this.isSelected = false,
    required this.onChanged,
    required this.onSaved,
    required this.validator,
  }) : super(key: key);
  final String hintText;
  final bool isSelected;
  final bool obscureText;
  final Function(String) onChanged;
  final Function(String?) onSaved;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        onSaved: onSaved,
        cursorColor: kPrimaryColor,
        obscureText: obscureText,
        decoration: basicInputDecoration(textTheme, hintText),
      ),
    );
  }
}
