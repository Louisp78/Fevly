import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/models/is_shopping.dart';
import 'package:fevly/models/product.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/test/data_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'custom_bottom_sheet_add_product.dart';
import 'drop_list.dart';
import 'list_tile_item.dart';
import 'list_tile_item_2.dart';
import 'load_list_product.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return SizedBox(
      height: size.height,
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.15, bottom: 60),
          child: SingleChildScrollView(
            child: ChangeNotifierProvider(
              create: (context) => IsShopping(isClick: true),
              // ignore: sort_child_properties_last
              child: Consumer<IsShopping>(
                builder: (context, isShopping, child) => Column(
                  children: [
                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.35),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.message_rounded,
                                  size: 24,
                                  color: !isShopping.expandState
                                      ? kPrimaryColor
                                      : Colors.black,
                                ),
                                onPressed: () => isShopping.expandState =
                                    !isShopping.expandState,
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.shopping_bag_rounded,
                              size: 30,
                              color: isShopping.expandState
                                  ? kPrimaryColor
                                  : Colors.black,
                            ),
                            onPressed: () => isShopping.expandState =
                                !isShopping.expandState,
                          ),
                        ],
                      ),
                    ),
                    if (isShopping.isClick)
                      Column(
                        children: [
                          SizedBox(height: size.height * 0.03),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05),
                            child: Row(
                              children: [
                                Text(
                                  "Courses",
                                  style: textTheme.headline2
                                      ?.copyWith(color: kDarkerTextColor),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          DropList(
                            isButton: true,
                            title: "A apporter",
                            iconData: Icons.add_rounded,
                            listWidget:
                                List.generate(productList1.length, (index) {
                              final Product productList = productList1[index];
                              return ListTileItem(
                                  title: productList.name,
                                  subtitle:
                                      "${productList.quantity} ${productList.unit.name}",
                                  margin: index != productList1.length
                                      ? EdgeInsets.only(
                                          bottom: size.height * 0.035)
                                      : null,
                                  leading: CustomCircleAvatar(
                                      radius: 20,
                                      icon: SizedBox(
                                          height: 20 * (32 / 25),
                                          width: 20 * (32 / 25),
                                          child: SvgPicture.asset(
                                              "assets/drink/mojito.svg"))),
                                  press: () {});
                            }),
                            addItemPress: () => showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (BuildContext context) {
                                  return const CustomBottomSheetAddProduct(
                                    title: "Ajouter un produit",
                                  );
                                }),
                          ),
                          const LoadListShopping(),
                          SizedBox(height: size.height * 0.001),
                          DropList(
                            title: "Apporté",
                            iconData: Icons.add_rounded,
                            listWidget:
                                List.generate(productList1.length, (index) {
                              final Product productList = productList1[index];
                              return ListTileItem2(
                                  title: productList.name,
                                  subtitle:
                                      "${productList.quantity} ${productList.unit.name}",
                                  margin: index != productList1.length
                                      ? EdgeInsets.only(
                                          bottom: size.height * 0.035)
                                      : null,
                                  leading: CustomCircleAvatar(
                                      radius: 20,
                                      icon: SizedBox(
                                          height: 20 * (32 / 25),
                                          width: 20 * (32 / 25),
                                          child: SvgPicture.asset(
                                              "assets/drink/mojito.svg"))),
                                  suffix: const CustomCircleAvatar(
                                    radius: 20,
                                  ),
                                  press: () {});
                            }),
                            addItemPress: () => showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (BuildContext context) {
                                  return const CustomBottomSheetAddProduct(
                                    title: "Ajouter une liste de courses",
                                  );
                                }),
                          ),
                          CustomTextButton(
                            press: () => showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (BuildContext context) {
                                  return const CustomBottomSheetAddProduct(
                                    title: "Ajouter un produit",
                                  );
                                }),
                            text: "Ajouter une course",
                            backgroundColor: kPrimaryColor,
                          ),
                          SizedBox(height: size.height * 0.05),
                        ],
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
        const Positioned(bottom: 0, child: CustomBottomBar()),
        CustomBasicAppBar(
          iconData: Icons.arrow_back_ios_rounded,
          press: () {},
          title: "Soirée exemple",
          subtitleText: "10 participants",
          prefixIcon: IconButton(
            icon: const Icon(Icons.info_rounded),
            color: Colors.black,
            onPressed: () {},
          ),
          firstSuffixIcon: IconButton(
            icon: const Icon(Icons.notifications),
            color: kSecondaryColor,
            onPressed: () {},
          ),
          secondSuffixIcon: IconButton(
            icon: const Icon(Icons.group_rounded),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
      ]),
    );
  }
}
