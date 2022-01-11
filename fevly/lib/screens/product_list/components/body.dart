import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/components/custom_product_item.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/sort_list.dart';
import 'package:fevly/models/product.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:fevly/styles/theme.dart';
import 'package:fevly/view_models/text_field_model_view.dart';
import 'package:flutter/material.dart';
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
          TextFieldModelView(listOfObjects: productList.listOfProduct),
      child: Consumer<TextFieldModelView>(
        builder: (context, searchField, child) => Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: kBasicVerticalPadding(size: size) * 6,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: kBasicHorizontalPadding(size: size)),
                    child: Focus(
                      onFocusChange: (focus) => searchField.selection = focus,
                      child: CustomTextField(
                          type: InputDecorationType.search,
                        onSaved: (value) {},
                        validator: (value) {},
                        width: searchField.selection
                            ? size.width * 0.75
                            : size.width * 0.45,
                        height: 37,
                        onChanged: (value) {
                          searchField.textValue = value;
                          searchField.listOfObjects = sortListProductBySearch(
                              sourceList: productList.listOfProduct,
                              search: searchField.textValue);
                        },
                          hintStyle: kSearchHintStyle(textTheme: textTheme),
                          hintText: "Rechercher un produit",
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    padding: EdgeInsets.only(
                      right: kBasicHorizontalPadding(size: size),
                      top: kBasicVerticalPadding(size: size),
                      bottom: 60 + kBasicVerticalPadding(size: size),
                    ),
                    mainAxisSpacing: kGridMainSpacing(size: size) * 1.5,
                    crossAxisSpacing: kGridCrossSpacing(size: size) * 0.25,
                    children: List.generate(searchField.listOfObjects!.length,
                        (index) {
                      final Product currentProduct =
                          searchField.listOfObjects![index] as Product;
                      return CustomProductItem(
                        product: currentProduct,
                        imgSize: size.width * 0.12,
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
                subtitleText: "${productList.numberOfProducts} produits",
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
