import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/components/custom_user_list_item.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/create_new_from.dart';
import 'package:fevly/models/guest_list.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/screens/search/components/user_search_bar.dart';
import 'package:fevly/screens/search/components/user_search_suggestion.dart';
import 'package:fevly/screens/search/search_screen.dart';
import 'package:fevly/view_models/list_user_view_model.dart';
import 'package:fevly/view_models/text_field_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body(
      {required this.appBar,
      required this.userSearchList,
      required this.userSuggestionList1,
      required this.userSuggestionList2,
      required this.suggestionList1Name,
      required this.suggestionList2Name,
      this.type = SearchScreenType.changeRelationState,
      this.guestList})
      : assert(
              type == SearchScreenType.addToAList && guestList != null || type != SearchScreenType.addToAList,
            "Need to define GuestList or not.");

  final Widget appBar;
  final List<User> userSearchList;
  final List<User> userSuggestionList1;
  final List<User>? userSuggestionList2;
  final String suggestionList1Name;
  final String? suggestionList2Name;
  final SearchScreenType type;
  final GuestList? guestList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => TextFieldModelView(listOfObjects: userSearchList),
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
                    sourceList: userSearchList,
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
            appBar,
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
      child: ListenableProvider<ListUserViewModel>(
        create: (context) => ListUserViewModel(list: guestList!.listOfUser),
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
                          create: (context) => createNewUserFrom(source: listOfUser[index]),
                          child: Consumer2<User, ListUserViewModel>(
                            builder:
                                (context, user, listUserViewModel, child) =>
                                    CustomUserListItem(
                              currentList: listOfUser,
                              index: index,
                              listOfUserViewModel: listUserViewModel,
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
                : Consumer<ListUserViewModel>(
                    builder: (context, listUserViewModel, child) =>
                        UserSearchSuggestion(
                      typeOfListItem: type,
                      userSuggestionList1: userSuggestionList1,
                      userSuggestionList2: userSuggestionList2,
                      suggestionList1Name: suggestionList1Name,
                      suggestionList2Name: suggestionList2Name,
                      listUserViewModel: listUserViewModel,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
