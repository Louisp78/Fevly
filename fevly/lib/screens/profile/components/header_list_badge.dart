import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/sort_list.dart';
import 'package:fevly/view_models/text_field_model_view.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:fevly/test/data_example.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderListBadge extends StatelessWidget {
  const HeaderListBadge({
    Key? key,
    required this.searchField,
  }) : super(key: key);

  final TextFieldModelView searchField;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: size.height * 0.01),
      width: size.width,
      height: searchField.selection ? size.height * 0.08 : size.height * 0.12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Focus(
            onFocusChange: (focus) => searchField.selection = focus,
            child: CustomTextField(
              width:
                  searchField.selection ? size.width * 0.75 : size.width * 0.45,
              height: 37,
              onChanged: (value) {
                searchField.textValue = value;
                searchField.listOfObjects = sortListBadgeBySearch(
                    sourceList: badgeList1, search: searchField.textValue);
              },
              decoration: smallSearchInputDecoration(
                hintStyle: kSearchHintStyle(textTheme: textTheme),
                hintText: "Rechercher un badges",
                size: size,
              ),
              onSaved: (value) {},
              validator: (value) {},
            ),
          ),
          Text(
            "${badgeList1.length}/100",
            style: textTheme.headline6?.copyWith(color: kTextColor),
          )
        ],
      ),
    );
  }
}
