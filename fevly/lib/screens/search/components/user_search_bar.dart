import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/sort_list.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:fevly/view_models/text_field_model_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSearchBar extends StatelessWidget {
  const UserSearchBar({
    Key? key,
    required this.textFieldModelView,
    required this.sourceList,
  }) : super(key: key);

  final TextFieldModelView textFieldModelView;
  final List<User> sourceList;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    return Focus(
      onFocusChange: (focus) => textFieldModelView.selection = focus,
      child: CustomTextField(
        padding: EdgeInsets.only(bottom: kBasicVerticalPadding(size: size)),
        onChanged: (value) {
          textFieldModelView.textValue = value;
          textFieldModelView.listOfObjects = sortListUserBySearch(
              sourceList: sourceList, search: textFieldModelView.textValue);
        },
        onSaved: (value) {},
        validator: (value) {},
        type: InputDecorationType.search,
            hintStyle: textTheme.headline4!.copyWith(color: kTextColor),
            hintText: "Rechercher quelqu’un ...",
      ),
    );
  }
}
