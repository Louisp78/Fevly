import 'package:fevly/constant.dart';
import 'package:fevly/models/product.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
