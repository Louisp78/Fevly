import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/components/custom_user_list_item.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/create_new_from.dart';
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
                  buildListOfUser(
                      size: size,
                      context: context,
                      textFieldModelView: textFieldModelView,
                      listOfUser: listOfUser),
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
  Expanded buildListOfUser(
      {required Size size,
      required BuildContext context,
      required TextFieldModelView<dynamic> textFieldModelView,
      required List<User> listOfUser}) {
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
                      return ChangeNotifierProvider(
                        create: (context) =>
                            createNewUserFrom(source: listOfUser[index]),
                        child: Consumer<User>(
                          builder: (context, user, child) => CustomUserListItem(
                            currentList: listOfUser,
                            index: index,
                            press: () => Navigator.pushNamed(
                                context, '/profile',
                                arguments: user),
                            user: user,
                          ),
                        ),
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
