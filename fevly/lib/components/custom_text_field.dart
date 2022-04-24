import 'package:fevly/constant.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final bool isSelected;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final bool withCleaning;
  final TextStyle? hintStyle;
  final String hintText;
  final InputDecorationType type;
  final TextEditingController? controller;
  final String? error_msg;
  final String? label_text;
  final String? prefix_text;
  final TextInputType? textInputType;

  const CustomTextField(
      {this.obscureText = false,
      this.isSelected = false,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.width,
      this.height,
      this.padding,
      this.withCleaning = false,
      this.hintStyle,
      required this.hintText,
      this.type = InputDecorationType.basic,
      this.controller,
      this.error_msg,
      this.textInputType,
      this.label_text,
      this.prefix_text});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller =
        widget.controller ?? TextEditingController();
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return Container(
      width: widget.width ?? size.width * 0.8,
      height: widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
          keyboardType: widget.textInputType,
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
          cursorColor: themeColor.primary,
          obscureText: widget.obscureText,
          decoration: getInputDecoration(type: widget.type, context: context)),
    );
  }

  InputDecoration getInputDecoration(
      {required InputDecorationType type, required BuildContext context}) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final InputDecorationTheme themeInput =
        Theme.of(context).inputDecorationTheme;
    switch (type) {
      case InputDecorationType.searchsmall:
        return smallSearchInputDecoration(
            hintStyle: widget.hintStyle ??
                kBasicHintStyle(textTheme: textTheme, themeColor: themeColor),
            hintText: widget.hintText,
            context: context);

      case InputDecorationType.search:
        return searchInputDecoration(
            hintStyle: widget.hintStyle ??
                kBasicHintStyle(textTheme: textTheme, themeColor: themeColor),
            hintText: widget.hintText,
            context: context);

      default:
        return InputDecoration(
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              kBasicHintStyle(textTheme: textTheme, themeColor: themeColor),
          errorText: widget.error_msg,
          labelText: widget.label_text,
          labelStyle: textTheme.headline3!.copyWith(color: kTextColor),
          prefixText: widget.prefix_text,
          errorMaxLines: 2,
        ).applyDefaults(themeInput);
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
      color: kTextColor,
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
        color: kTextColor,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
  );
}*/
}
