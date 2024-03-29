import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/models/product.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/screens/party/party_products/custom_bottom_sheet_add_product.dart';
import 'package:fevly/screens/party/party_products/drop_list.dart';
import 'package:fevly/screens/party/party_products/list_tile_item.dart';
import 'package:fevly/screens/party/party_products/list_tile_item_2.dart';
import 'package:fevly/screens/party/party_products/load_list_product.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/test_data/data_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PartyProductsScreen extends StatelessWidget {
  final ProductList productList;
  const PartyProductsScreen({
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
            listWidget: List.generate(productList1.length, (index) {
              final Product productList = productList1[index];
              return ListTileItem(
                  title: productList.name,
                  subtitle: "${productList.quantity} ${productList.unit.name}",
                  margin: index != productList1.length
                      ? EdgeInsets.only(bottom: size.height * 0.035)
                      : null,
                  leading: CustomCircleAvatar(
                      press: (){},
                      radius: 20,
                      icon: SizedBox(
                          height: 20 * (32 / 25),
                          width: 20 * (32 / 25),
                          child: SvgPicture.asset("assets/drink/mojito.svg"))),
                  press: () {});
            }),
            addItemPress: () => showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return CustomBottomSheetAddProduct(
                    title: "Ajouter un produit",
                    productList: productList,
                  );
                }),
          ),
          const LoadListShopping(),
          SizedBox(height: size.height * 0.001),
          DropList(
            title: "Apporté",
            iconData: Icons.add_rounded,
            listWidget: List.generate(productList1.length, (index) {
              final Product productList = productList1[index];
              return ListTileItem2(
                  title: productList.name,
                  subtitle: "${productList.quantity} ${productList.unit.name}",
                  margin: index != productList1.length
                      ? EdgeInsets.only(bottom: size.height * 0.035)
                      : null,
                  leading: CustomCircleAvatar(
                      radius: 20,
                      press: (){},
                      icon: SizedBox(
                          height: 20 * (32 / 25),
                          width: 20 * (32 / 25),
                          child: SvgPicture.asset("assets/drink/mojito.svg"))),
                  suffix: CustomCircleAvatar(
                    press: (){},
                    radius: 20,
                  ),
                  press: () {});
            }),
            addItemPress: () => showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return  CustomBottomSheetAddProduct(
                    title: "Ajouter une liste de courses",
                    productList: productList,
                  );
                }),
          ),
          CustomTextButton(
            press: () => showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return CustomBottomSheetAddProduct(
                    title: "Ajouter un produit",
                    productList: productList,
                  );
                }),
            text: "Ajouter une course",
          ),
          SizedBox(height: size.height * 0.1),
        ],
      ),
    );
  }
}
