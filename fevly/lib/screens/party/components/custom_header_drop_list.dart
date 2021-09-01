import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/view_models/dropdown_model_view.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeaderDropList extends StatelessWidget {
  const CustomHeaderDropList({
    Key? key,
    required this.title,
    required this.press,
    required this.button,
    required this.listLen,
    required this.myListsModelView,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;
  final CustomTextButton? button;
  final int listLen;
  final DropDownModelView myListsModelView;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AutoSizeText(
              title,
              style: textTheme.headline3?.copyWith(color: kTextColor),
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (button != null) button!,
              IconButton(
                onPressed: press,
                icon: Icon(
                  myListsModelView.isExpanded
                      ? Icons.expand_less_rounded
                      : Icons.expand_more_rounded,
                  size: 36,
                  color: kDarkerTextColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
