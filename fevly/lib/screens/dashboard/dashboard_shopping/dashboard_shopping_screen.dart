import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/product.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardShoppingScreen extends StatelessWidget {
  const DashboardShoppingScreen({Key? key, required this.productListList})
      : super(key: key);
  final List<ProductList> productListList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              buttonSize: CustomSmallButtonSize.small,
              borderWidth: 3,
              borderColor: kPrimaryColor,
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

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Container(
      margin: EdgeInsets.only(left: kBasicHorizontalPadding(size: size)),
      height: size.height * 0.17,
      width: size.height * 0.17,
      decoration: BoxDecoration(
        color: kSurfaceLightColor,
        boxShadow: [kShadowBase],
        borderRadius: BorderRadius.circular(size.height * 0.025),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            product.image,
            width: size.height * 0.08,
            height: size.height * 0.08,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            product.name,
            style: textTheme.headline6,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          Text(
            product.getQuantity(),
            style: textTheme.headline6?.copyWith(color: kTextColor),
          ),
        ],
      ),
    );
  }
}
