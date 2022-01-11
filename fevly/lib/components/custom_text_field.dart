import 'package:fevly/constant.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.obscureText = false,
    this.isSelected = false,
    required this.onChanged,
    required this.onSaved,
    required this.validator,
    this.width,
    this.height,
    this.padding,
    this.withCleaning = false,
    required this.hintStyle,
    required this.hintText, 
    this.type = InputDecorationType.basic
  });

  final bool isSelected;
  final bool obscureText;
  final Function(String) onChanged;
  final Function(String?) onSaved;
  final String? Function(String?) validator;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final bool withCleaning;
  final TextStyle hintStyle;
  final String hintText;
  final InputDecorationType type;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeColor themeColor = initThemeColor(context: context);
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
          cursorColor: themeColor.kPrimaryColor,
          obscureText: widget.obscureText,
          decoration: get_input_decoration(type: widget.type, context: context)
        ),
    );
  }

  InputDecoration get_input_decoration({required InputDecorationType type, required BuildContext context})
  {
    final InputDecorationTheme themeInput = Theme.of(context).inputDecorationTheme;
    switch (type)
    {
      case InputDecorationType.basic:
        return InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            ).applyDefaults(themeInput);
      default:
        return smallSearchInputDecoration(hintStyle: widget.hintStyle,
          hintText: widget.hintText,
           context: context);
    }
  }

/*InputDecoration smallSearchInputDecoration(
    {required TextStyle hintStyle,
    required String hintText,
    required Size size,
    required ThemeColor themeColor}) {
  return InputDecoration(
    filled: true,
    prefixIcon: Icon(
      Icons.search_rounded,
      color: themeColor.kTextColor,
      size: kSmallIconSize,
    ),
    hintText: hintText,
    fillColor: themeColor.kSurfaceColor,
    hintStyle: hintStyle,
    contentPadding: EdgeInsets.only(
      left: size.width * 0.045,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: themeColor.kPrimaryColor,
        width: 3.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: themeColor.kErrorColor,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: themeColor.kErrorColor,
        width: 3.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: themeColor.kTextColor,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
  );
}*/
}
