import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'components/products_of_party_section.dart';

class DashboardShoppingScreen extends StatelessWidget {
  const DashboardShoppingScreen({Key? key, required this.productListList})
      : super(key: key);
  final List<ProductList> productListList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeColor themeColor = initThemeColor();
    return SizedBox(
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kBasicVerticalPadding(size: size) * 4,
            ),
            CustomSmallButton(
              press: () {},
              text: "10 produits",
              textColor: themeColor.kBaseOppositeColor,
              buttonSize: CustomSmallButtonSize.small,
              borderWidth: 3,
              borderColor: themeColor.kPrimaryColor,
            ),
            SizedBox(
              height: kBasicVerticalPadding(size: size) * 1.5,
            ),
            Column(
              children: List.generate(
                productListList.length,
                (index) =>
                    ProductsOfPartySection(productList: productListList[index]),
              ),
            ),
            const SizedBox(
              height: 86,
            ),
          ],
        ),
      ),
    );
  }
}
