import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/components/custom_user_list_item.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/build_app_bar_for_search_screen.dart';
import 'package:fevly/functions/create_new_from.dart';
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
      {required this.userSuggestionList1,
      required this.userSuggestionList2,
      required this.suggestionList1Name,
      required this.suggestionList2Name,
      this.type = SearchScreenType.all,
      required this.mainList});

  final List<User> mainList;
  final SearchScreenType type;
  final List<User> userSuggestionList1;
  final String suggestionList1Name;

  final List<User>? userSuggestionList2;
  final String? suggestionList2Name;

  @override
  Widget build(BuildContext context) {
    const double heightAppBar = 110;
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => TextFieldModelView(listOfObjects: mainList),
      child: Consumer<TextFieldModelView>(
          builder: (context, textFieldModelView, child) {
        final List<User> listOfUser =
            textFieldModelView.listOfObjects! as List<User>;
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: heightAppBar),
              child: TabBarView(children: [
                Container(),
                buildListOfUser(
                    size: size,
                    textFieldModelView: textFieldModelView,
                    listOfUser: listOfUser),
              ]),
            ),
            const Positioned(bottom: 0, child: CustomBottomBar()),
            buildAppBarForSearchScreen(
              heightAppBar: heightAppBar,
              searchBar: UserSearchBar(
                hintText: getHintText(type: type),
                textFieldModelView: textFieldModelView,
                sourceList: mainList,
              ),
            )
          ],
        );
      }),
    );
  }

  //$ METHOD
  //$ ================================================================

  String getHintText({required SearchScreenType type}) {
    switch (type) {
      case SearchScreenType.guests:
        return "Rechercher des invités...";
      case SearchScreenType.organizers:
        return "Rechercher des organisateurs...";
      case SearchScreenType.all:
        return "Rechercher des personnes ou des soirées...";
      default:
        return "Rechercher des personnes ou des soirées...";
    }
  }

  Widget buildListOfUser(
      {required Size size,
      required TextFieldModelView<dynamic> textFieldModelView,
      required List<User> listOfUser}) {
    return Builder(builder: (context) {
      return ListenableProvider<ListUserViewModel>(
        create: (context) => ListUserViewModel(list: mainList),
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
      );
    });
  }
}
