import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
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
    this.padding,
    this.withCleaning = false,
  }) : super(key: key);
  final bool isSelected;
  final bool obscureText;
  final Function(String) onChanged;
  final Function(String?) onSaved;
  final String? Function(String?) validator;
  final InputDecoration decoration;
  final double? width, height;
  final EdgeInsets? padding;
  final bool withCleaning;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: widget.width ?? size.width * 0.8,
      height: widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
          controller: _controller,
          onEditingComplete: widget.withCleaning
              ? () {
                  _controller.clear();
                  FocusScope.of(context).unfocus();

                  setState(() {});
                }
              : null,
          onChanged: widget.onChanged,
          validator: widget.validator,
          onSaved: widget.onSaved,
          cursorColor: kPrimaryColor,
          obscureText: widget.obscureText,
          decoration:
              widget.decoration //basicInputDecoration(textTheme, hintText),
          ),
    );
  }
}
