import 'package:fevly/components/custom_drop_list.dart';
import 'package:fevly/components/custom_user_list_item.dart';
import 'package:fevly/test/data_example.dart';
import 'package:flutter/material.dart';

class UserSearchSuggestion extends StatelessWidget {
  const UserSearchSuggestion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropList(
          title: "Récent",
          displayButton: false,
          listWidget: List.generate(
            listOfUsers1.length,
            (index) {
              return CustomUserListItem(
                currentList: listOfUsers1,
                index: index,
              );
            },
          ),
        ),
        CustomDropList(
          title: "Amis",
          displayButton: false,
          listWidget: List.generate(
            listOfUsers1.length,
            (index) {
              return CustomUserListItem(
                currentList: listOfFriends1,
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
