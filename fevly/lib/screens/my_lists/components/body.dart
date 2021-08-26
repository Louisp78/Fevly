import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/build_app_bar_for_search_screen.dart';
import 'package:fevly/screens/my_lists/components/custom_bottom_sheet_guest_list.dart';
import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/models/guest_list.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/screens/search/search_screen.dart';
import 'package:fevly/test/data_guest_list.dart';
import 'package:fevly/test/data_list_of_user.dart';
import 'package:fevly/test/data_product_list.dart';
import 'package:flutter/material.dart';
import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/screens/my_lists/components/custom_bottom_sheet_product_list.dart';
import 'package:fevly/components/custom_drop_list.dart';
import 'list_tile_item.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.listOfProductList,
    required this.listOfGuestList,
  }) : super(key: key);

  final List<ProductList> listOfProductList;
  final List<GuestList> listOfGuestList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 110,
                ),
                buildGuestList(size, context),
                SizedBox(
                  height: size.height * 0.03,
                ),
                buildProductList(size, context),
                SizedBox(
                  height: kBasicVerticalPadding(size: size * 5),
                ),
              ],
            ),
          ),
          const Positioned(bottom: 0, child: CustomBottomBar()),
          CustomBasicAppBar(
            iconData: Icons.arrow_back_ios_rounded,
            press: () => Navigator.pop(context),
            title: "Mes Listes",
            subtitleText: "4 listes",
          ),
        ],
      ),
    );
  }

  //$ METHOD
  //$ ==============================================================

  CustomDropList buildProductList(Size size, BuildContext context) {
    return CustomDropList(
      title: "Listes de courses",
      iconData: Icons.playlist_add_rounded,
      listWidget: List.generate(productListListForDropdown.length, (index) {
        final ProductList productList = productListListForDropdown[index];
        return ListTileItem(
          margin: index != productListListForDropdown.length - 1
              ? EdgeInsets.only(bottom: size.height * 0.035)
              : null,
          title: productList.name,
          subtitle: "${productList.numberOfProducts} produits",
          leading: const CustomCircleAvatar(
            radius: 20,
          ),
          press: () => Navigator.pushNamed(
              context, "/profile/my_lists/product_list",
              arguments: productList),
        );
      }),
      addItemPress: () => showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return const CustomBottomSheetProductList(
              title: "Ajouter une liste de courses",
            );
          }),
    );
  }

  CustomDropList buildGuestList(Size size, BuildContext context) {
    return CustomDropList(
      title: "Listes d'invités",
      iconData: Icons.group_add_rounded,
      listWidget: List.generate(guestListListForDropdown.length, (index) {
        final GuestList guestList = guestListListForDropdown[index];
        return ListTileItem(
          title: guestList.name,
          margin: index != productListListForDropdown.length - 1
              ? EdgeInsets.only(bottom: size.height * 0.035)
              : null,
          subtitle: "${guestList.numberOfGuests} invités",
          leading: const CustomCircleAvatar(
            radius: 20,
          ),
          press: () => Navigator.pushNamed(context, "/search", arguments: {
            'guestList': guestList,
            'appBar': buildAppBarForSearchScreen(guestList, context),
            'suggestionList1Name': "Dans la liste",
            'suggestionList2Name': "Récent",
            'userSuggestionList1': guestList.listOfUser,
            'userSuggestionList2': listOfUsers1,
            'type': SearchScreenType.addToAList,
          }),
        );
      }),
      addItemPress: () => showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return const CustomBottomSheetGuestList(
              title: "Ajouter une liste d'invités",
            );
          }),
    );
  }
}
