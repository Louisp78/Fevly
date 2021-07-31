import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/components/custom_grid_item.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/sort_list.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/models/text_field_provider.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:fevly/models/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.productList}) : super(key: key);

  final ProductList productList;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) =>
          TextFieldProvider(listOfObjects: productList.listOfProduct),
      child: Consumer<TextFieldProvider>(
        builder: (context, searchField, child) => Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: kBasicVerticalPadding(size: size * 6),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: kBasicHorizontalPadding(size: size)),
                    child: Focus(
                      onFocusChange: (focus) => searchField.selection = focus,
                      child: CustomTextField(
                        width: searchField.selection
                            ? size.width * 0.75
                            : size.width * 0.45,
                        height: 37,
                        onChanged: (value) {
                          searchField.textValueOverride = value;
                          searchField.listOfObjects = sortListProductBySearch(
                              sourceList: productList.listOfProduct,
                              search: searchField.textValueOverride);
                        },
                        decoration: badgeSearchInputDecoration(
                          hintStyle: kSearchHintStyle(textTheme: textTheme),
                          hintText: "Rechercher un produit",
                          size: size,
                        ),
                        onSaved: (value) {},
                        validator: (value) {},
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.7,
                  child: GridView.count(
                    crossAxisCount: 3,
                    padding: EdgeInsets.symmetric(
                      horizontal: kBasicHorizontalPadding(size: size),
                      vertical: kBasicVerticalPadding(size: size),
                    ),
                    mainAxisSpacing: kGridMainSpacing(size: size),
                    crossAxisSpacing: kGridCrossSpacing(size: size),
                    children: List.generate(searchField.listOfObjects!.length,
                        (index) {
                      final Product currentProduct =
                          searchField.listOfObjects![index] as Product;
                      return CustomGridItem(
                        product: currentProduct,
                      );
                    }),
                  ),
                )
              ],
            ),
            const Positioned(bottom: 0, child: CustomBottomBar()),
            Positioned(
              top: 0,
              child: CustomBasicAppBar(
                title: productList.name,
                subtitle: "${productList.numberOfProducts} produits",
                iconData: Icons.arrow_back_ios_rounded,
                press: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
