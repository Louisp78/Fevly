import 'package:fevly/models/user.dart';
import 'package:fevly/screens/search/components/body.dart';
import 'package:fevly/view_models/tab_controller_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SearchScreenType { all, guests, organizers }

//* TODO: Hot fix needed on search bar
class SearchScreen extends StatelessWidget {
  const SearchScreen({
    this.type = SearchScreenType.all,
    required this.mainList,
    required this.suggestionList1Name,
    required this.userSuggestionList1,
    required this.suggestionList2Name,
    required this.userSuggestionList2,
  });

  final List<User> mainList;
  final SearchScreenType type;
  final String suggestionList1Name;
  final List<User> userSuggestionList1;

  final String? suggestionList2Name;
  final List<User>? userSuggestionList2;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TabControllerViewModel(index: 0),
      child: DefaultTabController(
        length: 2,
        child: Consumer<TabControllerViewModel>(
          builder: (context, tabControllerViewModel, _) => Builder(
            builder: (context) {
              final TabController controller =
                  DefaultTabController.of(context)!;
              controller.addListener(() {
                if (!controller.indexIsChanging) {
                  tabControllerViewModel.index = controller.index;
                }
              });
              return SafeArea(
                child: Scaffold(
                  body: Body(
                    mainList: mainList,
                    suggestionList1Name: suggestionList1Name,
                    userSuggestionList1: userSuggestionList1,
                    suggestionList2Name: suggestionList2Name,
                    userSuggestionList2: userSuggestionList2,
                    type: type,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
