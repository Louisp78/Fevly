import 'package:fevly/components/custom_product_item.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProductsOfPartySection extends StatelessWidget {
  const ProductsOfPartySection({
    Key? key,
    required this.productList,
  }) : super(key: key);

  final ProductList productList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productList.name,
                style: textTheme.headline2,
              ),
              Text(
                "${productList.numberOfProducts} produits",
                style: textTheme.headline6?.copyWith(color: kTextColor),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: size.height * 0.25,
            child: Padding(
              padding: EdgeInsets.only(
                left: kBasicHorizontalPadding(size: size),
                right: kBasicHorizontalPadding(size: size),
              ),
              child: Row(
                children: List.generate(
                  productList.numberOfProducts,
                  (index) => CustomProductItem(
                      product: productList.listOfProduct[index]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
