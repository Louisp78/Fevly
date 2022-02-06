import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/functions/build_app_bar_for_search_screen.dart';
import 'package:fevly/models/party.dart';
import 'package:fevly/screens/party/party_chat/chat_screen.dart';
import 'package:fevly/screens/party/party_products/products_screen.dart';
import 'package:fevly/screens/search/search_screen.dart';
import 'package:fevly/test_data/data_list_of_user.dart';
import 'package:fevly/view_models/tab_controller_view_model.dart';
import 'package:fevly/screens/party/components/party_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final Party party;
  const Body({Key? key, 
  required this.party
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return ChangeNotifierProvider(
      create: (context) => TabControllerViewModel(index: 0),
      child: DefaultTabController(
          length: 2,
          child: Consumer<TabControllerViewModel>(
            builder: (context, tabControllerViewModel, child) =>
                Builder(builder: (context) {
              final TabController controller =
                  DefaultTabController.of(context)!;
              controller.addListener(() {
                if (!controller.indexIsChanging) {
                  tabControllerViewModel.index = controller.index;
                }
              });
              return SafeArea(
                child: Scaffold(
                  body: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 110,
                        ),
                        child: TabBarView(
                            children: [const PartyChatScreen(), PartyProductsScreen(productList: party.products,)]),
                      ),
                      const Positioned(
                          top: 130, left: 0, right: 0, child: PartyMenu()),
                      const Positioned(bottom: 0, child: CustomBottomBar()),
                      CustomBasicAppBar(
                        iconData: Icons.arrow_back_ios_rounded,
                        press: () => Navigator.pop(context),
                        title: party.name,
                        subtitleText: "${party.guestsLength} participants",
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.info_rounded),
                          color: themeColor.onBackground,
                          onPressed: () => Navigator.pushNamed(context, '/party/party_info', arguments: party),
                        ),
                        /*firstSuffixIcon: IconButton(
                          icon: const Icon(Icons.notifications),
                          color: themeColor.kSecondaryColor,
                          onPressed: () {},
                        ),*/
                        secondSuffixIcon: IconButton(
                          icon: const Icon(Icons.group_rounded),
                          color: themeColor.onBackground,
                          onPressed: () =>
                            Navigator.pushNamed(context, '/search', arguments: {
                          'guestList': party.guests,
                          'type': SearchScreenType.guests,
                          'suggestionList1Name': 'Invités',
                          'userSuggestionList1': party.guests.listOfUser,
                          'suggestionList2Name': 'Mes amis',
                          'userSuggestionList2': listOfFriends1.where((element) => party.guests.listOfUser.contains(element)).toList()
                        }),

                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          )),
    );
  }
}
