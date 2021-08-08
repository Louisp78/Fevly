import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/models/guest_list.dart';
import 'package:fevly/models/is_shopping.dart';
import 'package:fevly/models/product.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/screens/my_lists/components/custom_bottom_sheet_guest_list.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/test/data_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';
import 'add_and_load_shopping.dart';
import 'custom_bottom_sheet_product_list.dart';
import 'drop_list.dart';
import 'list_tile_item.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return SizedBox(
      height: size.height,
      child: Stack(
        children: [ 
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.15, bottom: 60),
            child: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: size.height * 0.03),
                  ChangeNotifierProvider(
                  create: (context) => IsShopping(isClick: true),
                  // ignore: sort_child_properties_last
                  child: Consumer<IsShopping>(
                  builder: (context, isShopping, child) => 
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.35),
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
                                    color: !isShopping.expandState ? kPrimaryColor : Colors.black,
                                    ),
                                  onPressed: () => isShopping.expandState = !isShopping.expandState,
                                ),
                              ],
                            ),
                            IconButton(
                              icon : Icon(
                                Icons.shopping_bag_rounded,
                                size: 30,
                                color: isShopping.expandState ? kPrimaryColor : Colors.black,
                                ),
                              onPressed: () => isShopping.expandState = !isShopping.expandState,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),  
                      child: Row(
                        children: [
                          Text(
                            "Courses",
                            style: textTheme.headline2?.copyWith(color: kDarkerTextColor),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    DropList(
                      title: "A apporter",
                      iconData: Icons.group_add_rounded,
                      listWidget:
                          List.generate(productList1.length, (index) {
                        final Product productList = productList1[index];
                        return ListTileItem(
                          title: productList.name,
                          margin: index != productList1.length - 1
                              ? EdgeInsets.only(bottom: size.height * 0.035)
                              : null,
                          leading: const CustomCircleAvatar(
                            radius: 20,
                          ),
                          press: () {}
                        );
                      }),
                      addItemPress: () => showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return const CustomBottomSheetProductList(
                                  title: "Ajouter une liste de courses",
                            );
                          }
                        ),
                    ),
                    SizedBox(height: size.height * 0.001),
                    const AddAndLoadShopping(),
                    SizedBox(height: size.height * 0.001),
                    DropList(
                      title: "Apporté",
                      iconData: Icons.group_add_rounded,
                      listWidget:
                          List.generate(productList1.length, (index) {
                        final Product productList = productList1[index];
                        return ListTileItem(
                          title: productList.name,
                          margin: index != productList1.length - 1
                              ? EdgeInsets.only(bottom: size.height * 0.035)
                              : null,
                          leading: const CustomCircleAvatar(
                            radius: 20,
                          ),
                          press: () {}
                        );
                      }),
                      addItemPress: () => showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return const CustomBottomSheetProductList(
                                  title: "Ajouter une liste de courses",
                      );
                    }
                  ),
                ),
                 CustomTextButton(
                  press: () => showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return const CustomBottomSheetProductList(
                            title: "Ajouter un produit",
                          );
                        }),
                  text: "Ajouter une course",
                  backgroundColor: kPrimaryColor,
                ),
                SizedBox(height: size.height * 0.05),
              ],
            ),
        ),
          ),
        const Positioned(bottom: 0, child: CustomBottomBar()),
        CustomBasicAppBar(
          iconData: Icons.arrow_back_ios_rounded,
          press: () {},
          title: "Soirée exemple",
          subtitle: "10 participants",
        ),
        ]
      ),
    );
  }
}

