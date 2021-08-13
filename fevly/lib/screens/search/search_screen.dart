import 'package:fevly/models/guest_list.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/test/data_list_of_user.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

enum SearchScreenType { addToAList, changeRelationState }

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    this.guestList,
    required this.appBar,
    this.type = SearchScreenType.changeRelationState,
    required this.suggestionList1Name,
    required this.userSuggestionList1,
    required this.suggestionList2Name,
    required this.userSuggestionList2,
  }) :
        //* TEST
        assert(
            type == SearchScreenType.addToAList && guestList != null ||
                type == SearchScreenType.changeRelationState &&
                    guestList == null,
            "Define a guestList when type is addToList.");

  final GuestList? guestList;
  final Widget appBar;
  final SearchScreenType type;
  final String suggestionList1Name;
  final List<User> userSuggestionList1;
  final String suggestionList2Name;
  final List<User> userSuggestionList2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        appBar: appBar,
        userSearchList: listOfUsers1,
        suggestionList1Name: suggestionList1Name,
        userSuggestionList1: userSuggestionList1,
        suggestionList2Name: suggestionList2Name,
        userSuggestionList2: userSuggestionList2,
        type: type,
        guestList: guestList,
      ),
    );
  }
}
