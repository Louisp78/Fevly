import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/screens/dashboard/dashboard_products/components/products_of_party_section.dart';
import 'package:flutter/material.dart';

class DashboardProductsScreen extends StatelessWidget {
  const DashboardProductsScreen({Key? key, required this.productListList})
      : super(key: key);
  final List<ProductList> productListList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
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
              textColor: themeColor.onBackground,
              buttonSize: CustomSmallButtonSize.small,
              borderWidth: 3,
              borderColor: themeColor.primary,
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
