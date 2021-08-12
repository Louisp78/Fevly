import 'package:fevly/components/custom_drop_list.dart';
import 'package:fevly/components/custom_user_list_item.dart';
import 'package:fevly/functions/create_new_from.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/test/data_example.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              return ChangeNotifierProvider(
                create: (context) =>
                    createNewUserFrom(source: listOfUsers1[index]),
                child: Consumer<User>(
                  builder: (context, user, child) => CustomUserListItem(
                    currentList: listOfUsers1,
                    index: index,
                    press: () => Navigator.pushNamed(context, '/profile',
                        arguments: user),
                    user: user,
                  ),
                ),
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
              return ChangeNotifierProvider(
                create: (context) =>
                    createNewUserFrom(source: listOfFriends1[index]),
                child: Consumer<User>(
                  builder: (context, user, child) => CustomUserListItem(
                    currentList: listOfFriends1,
                    index: index,
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
