import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_bottom_sheet_product_list.dart';

class AddAndLoadShopping extends StatelessWidget {
  const AddAndLoadShopping({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * 0.44,
            height: size.height * 0.08,
            decoration: BoxDecoration(
              color: kSurfaceLightColor,
              boxShadow: [kShadowBase],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "Charger une liste de course",
                      maxLines: 2,
                      style: textTheme.headline5?.copyWith(color: kDarkerTextColor),
                      ),
                  ),
                  const Icon(
                    Icons.add,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return const CustomBottomSheetProductList(
                    title: "Ajouter un produit",
                  );
                }),
            child: Container(
              width: size.width * 0.44,
              height: size.height * 0.08,
              decoration: BoxDecoration(
                color: kSurfaceLightColor,
                boxShadow: [kShadowBase],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "Ajouter un produit",
                        maxLines: 2,
                        style: textTheme.headline5?.copyWith(color: kDarkerTextColor),
                        ),
                    ),
                    const Icon(
                      Icons.add,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}