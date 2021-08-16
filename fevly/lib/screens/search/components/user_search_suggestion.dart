import 'package:fevly/components/custom_drop_list.dart';
import 'package:fevly/components/custom_user_list_item.dart';
import 'package:fevly/functions/create_new_from.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/screens/search/search_screen.dart';
import 'package:fevly/view_models/list_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserSearchSuggestion extends StatelessWidget {
  const UserSearchSuggestion({
    this.typeOfListItem = SearchScreenType.changeRelationState,
    required this.userSuggestionList1,
    required this.userSuggestionList2,
    required this.suggestionList1Name,
    required this.suggestionList2Name,
    this.listUserViewModel,
  })  : assert(
            typeOfListItem == SearchScreenType.changeRelationState &&
                    listUserViewModel == null ||
                typeOfListItem == SearchScreenType.addToAList &&
                    listUserViewModel != null,
            "Need to define GuestList or not."),
        assert(
            userSuggestionList2 == null && suggestionList2Name == null ||
                userSuggestionList2 != null && suggestionList2Name != null,
            "userSuggestionList2 must be define in the same time than name.");

  final SearchScreenType typeOfListItem;
  final List<User> userSuggestionList1;
  final List<User>? userSuggestionList2;
  final String suggestionList1Name;
  final String? suggestionList2Name;
  final ListUserViewModel? listUserViewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropList(
          title: suggestionList1Name,
          displayButton: false,
          listWidget: List.generate(
            userSuggestionList1.length,
            (index) {
              return ChangeNotifierProvider(
                create: (context) =>
                    createNewUserFrom(source: userSuggestionList1[index]),
                child: Consumer<User>(
                  builder: (context, user, child) => CustomUserListItem(
                    currentList: userSuggestionList1,
                    index: index,
                    type: typeOfListItem,
                    listOfUserViewModel: listUserViewModel,
                    press: () => Navigator.pushNamed(context, '/profile',
                        arguments: user),
                    user: user,
                  ),
                ),
              );
            },
          ),
        ),
        if (userSuggestionList2 != null)
          CustomDropList(
            title: suggestionList2Name!,
            displayButton: false,
            listWidget: List.generate(
              userSuggestionList2!.length,
              (index) {
                return ChangeNotifierProvider(
                  create: (context) =>
                      createNewUserFrom(source: userSuggestionList2![index]),
                  child: Consumer<User>(
                    builder: (context, user, child) => CustomUserListItem(
                      currentList: userSuggestionList2!,
                      index: index,
                      type: typeOfListItem,
                      listOfUserViewModel: listUserViewModel,
                      press: () => Navigator.pushNamed(context, '/profile',
                          arguments: user),
                      user: user,
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
