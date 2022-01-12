import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/functions/build_app_bar_for_search_screen.dart';
import 'package:fevly/screens/party/components/chat_screen.dart';
import 'package:fevly/screens/party/components/shopping_screen.dart';
import 'package:fevly/screens/search/search_screen.dart';
import 'package:fevly/test_data/data_guest_list.dart';
import 'package:fevly/view_models/tab_controller_view_model.dart';
import 'package:fevly/screens/party/components/party_menu.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ThemeColor themeColor = initThemeColor(context: context);
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
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 110,
                        ),
                        child: TabBarView(
                            children: [ChatScreen(), ShoppingScreen()]),
                      ),
                      const Positioned(
                          top: 130, left: 0, right: 0, child: PartyMenu()),
                      const Positioned(bottom: 0, child: CustomBottomBar()),
                      CustomBasicAppBar(
                        iconData: Icons.arrow_back_ios_rounded,
                        press: () => Navigator.pop(context),
                        title: "Soirée exemple",
                        subtitleText: "10 participants",
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.info_rounded),
                          color: themeColor.kBaseOppositeColor,
                          onPressed: () => Navigator.pushNamed(context, '/party/party_info'),
                        ),
                        /*firstSuffixIcon: IconButton(
                          icon: const Icon(Icons.notifications),
                          color: themeColor.kSecondaryColor,
                          onPressed: () {},
                        ),*/
                        secondSuffixIcon: IconButton(
                          icon: const Icon(Icons.group_rounded),
                          color: themeColor.kBaseOppositeColor,
                          onPressed: () =>
                            Navigator.pushNamed(context, '/search', arguments: {
                          'guestList': guestListList[0],
                          'appBar': buildAppBarForSearchScreen(
                              guestListList[0], context),
                          'type': SearchScreenType.addToAList,
                          'suggestionList1Name': 'Invités',
                          'userSuggestionList1': guestListList[0].listOfUser
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
