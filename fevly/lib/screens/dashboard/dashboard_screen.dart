import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/screens/dashboard/dashboard_parties/dashboard_parties_screen.dart';
import 'package:fevly/screens/dashboard/dashboard_shopping/dashboard_shopping_screen.dart';
import 'package:fevly/screens/dashboard/view_models/tab_controller_view_model.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/test/data_party.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/custom_dashboard_app_bar.dart';
import 'dashboard_parties/components/dashboard_menu.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  floatingActionButton: tabControllerViewModel.index == 1
                      ? buildFloatingActionButton() //! Need to set showBottomSheet
                      : null,
                  body: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 85,
                        ),
                        child: TabBarView(children: [
                          DashboardPartiesScreen(
                            partiesInvite: partiesInvite,
                            partiesAccepted: partiesAccepted,
                          ),
                          DashboardShoppingScreen(
                            productListList:
                                partiesAccepted.map((e) => e.products).toList(),
                          ),
                        ]),
                      ),
                      const Positioned(
                          top: 100, left: 0, right: 0, child: DashboardMenu()),
                      const Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomBottomBar()),
                      const CustomDashboardAppBar(),
                    ],
                  ),
                ),
              );
            }),
          )),
    );
  }

  //$ METHOD
  //$ ===========================================
  Padding buildFloatingActionButton() {
    final ThemeColor themeColor = initThemeColor();
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: FloatingActionButton(
        backgroundColor: themeColor.kPrimaryColor,
        onPressed: () {},
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
