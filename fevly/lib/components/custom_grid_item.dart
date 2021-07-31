import 'package:fevly/models/badge.dart';
import 'package:fevly/models/product.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomGridItem extends StatelessWidget {
  const CustomGridItem({
    Key? key,
    this.badge,
    this.product,
  }) : super(key: key);

  final Badge? badge;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: kSurfaceLightColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [kShadowBase],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              badge != null ? badge!.image : product!.image,
              width: size.width * 0.11,
              height: size.width * 0.11,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              badge != null
                  ? "${badge!.name} ${getBadgeTypeName(badge!.badgeType)}"
                  : product!.name,
              style: textTheme.headline6,
              maxLines: 1,
            ),
            const SizedBox(
              height: 3.0,
            ),
            Text(
              badge != null
                  ? "x${badge!.quantity}"
                  : (product!.unit != QuantityUnit.none
                      ? "${product!.getStringQuantity()} ${product!.getQuantityUnitName()}"
                      : product!.getStringQuantity()),
              style: textTheme.headline6?.copyWith(color: kTextColor),
            )
          ],
        ),
      ),
    );
  }
}
