import 'package:fevly/screens/party/components/custom_button_sheet_load_list_product.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadListShopping extends StatelessWidget {
  const LoadListShopping({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            highlightColor: Colors.white,
            onTap: () => showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return const CustomBottomSheetLoadListProduct(
                      title: "Charger une liste de course");
                }),
            child: Container(
              width: size.width * 0.9,
              height: size.height * 0.08,
              decoration: BoxDecoration(
                color: kSurfaceLightColor,
                boxShadow: [kShadowBase],
                borderRadius: BorderRadius.circular(20),
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
                        style: textTheme.headline5
                            ?.copyWith(color: kDarkerTextColor),
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
