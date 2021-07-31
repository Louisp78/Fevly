import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/screens/my_lists/components/custom_bottom_sheet_guest_list.dart';
import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/models/guest_list.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/test/data_example.dart';
import 'package:flutter/material.dart';
import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/screens/my_lists/components/custom_bottom_sheet_product_list.dart';
import 'drop_list.dart';
import 'list_tile_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
                SizedBox(
                  height: kBasicVerticalPadding(size: size * 5),
                ),
                DropList(
                  title: "Listes d'invités",
                  iconData: Icons.group_add_rounded,
                  listWidget:
                      List.generate(guestListListForDropdown.length, (index) {
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
                      press: () => Navigator.pushNamed(
                          context, "/profile/my_lists/guest_list",
                          arguments: guestList),
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
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                DropList(
                  title: "Listes de courses",
                  iconData: Icons.playlist_add_rounded,
                  listWidget:
                      List.generate(productListListForDropdown.length, (index) {
                    final ProductList productList =
                        productListListForDropdown[index];
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
                ),
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
          ),
        ],
      ),
    );
  }
}
