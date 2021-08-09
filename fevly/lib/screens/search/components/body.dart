import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/components/custom_user_list_item.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/screens/search/components/user_search_bar.dart';
import 'package:fevly/screens/search/components/user_search_suggestion.dart';
import 'package:fevly/test/data_example.dart';
import 'package:fevly/view_models/text_field_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => TextFieldModelView(listOfObjects: listOfUsers1),
      child: Consumer<TextFieldModelView>(
          builder: (context, textFieldModelView, child) {
        final List<User> listOfUser =
            textFieldModelView.listOfObjects! as List<User>;
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 110),
              child: Column(
                children: [
                  SizedBox(
                    height: kBasicVerticalPadding(size: size),
                  ),
                  UserSearchBar(
                    textFieldModelView: textFieldModelView,
                  ),
                  buildListOfUser(size, textFieldModelView, listOfUser),
                ],
              ),
            ),
            const Positioned(bottom: 0, child: CustomBottomBar()),
            CustomBasicAppBar(
              title: "Recherche",
              subtitleIcon: const Icon(Icons.group_rounded),
              press: () {},
            )
          ],
        );
      }),
    );
  }

  //$ METHOD
  //$ ================================================================
  Expanded buildListOfUser(Size size,
      TextFieldModelView<dynamic> textFieldModelView, List<User> listOfUser) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: kBasicVerticalPadding(size: size) * 3,
          ),
          child: textFieldModelView.selection
              ? SizedBox(
                  width: size.width,
                  child: Column(
                    children: List.generate(listOfUser.length, (index) {
                      return CustomUserListItem(
                        currentList: listOfUser,
                        index: index,
                      );
                    }),
                  ),
                )
              : const UserSearchSuggestion(),
        ),
      ),
    );
  }
}
