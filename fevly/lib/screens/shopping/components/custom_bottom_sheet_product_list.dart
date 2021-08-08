import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/general.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/models/text_field_provider.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:fevly/test/data_example.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomBottomSheetProductList extends StatelessWidget {
  const CustomBottomSheetProductList({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return ChangeNotifierProvider(
      create: (context) => TextFieldProvider<ProductList>(),
      child: Consumer<TextFieldProvider<ProductList>>(
        builder: (context, textFieldProvider, child) =>
            Stack(clipBehavior: Clip.none, children: [
          Container(
            alignment: Alignment.center,
            height:
                textFieldProvider.selection ? size.height : size.height * 0.4,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.03),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(69),
                topRight: Radius.circular(69),
              ),
              color: kSurfaceLightColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.6,
                  child: AutoSizeText(
                    title,
                    maxLines: 1,
                    style: textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                ),
                if (textFieldProvider.selection)
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                if (!textFieldProvider.selection) const Spacer(),
                Focus(
                  onFocusChange: (focus) => textFieldProvider.selection = focus,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: size.width * 0.20,
                          width: size.width * 0.20,
                          decoration: BoxDecoration(
                            color: kSurfaceLightColor,
                            boxShadow: [kShadowBase],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: size.width * 0.02),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(height: size.height * 0.001),
                                Icon(
                                  Icons.category,
                                  size: size.width * 0.08,
                                ),
                                Text(
                                  "Catégorie",
                                  style: textTheme.headline5?.copyWith(color: kDarkerTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      CustomTextField(
                        onChanged: (value) {
                          textFieldProvider.textValueOverride = value;
                        },
                        onSaved: (value) {},
                        validator: (value) {},
                        width: size.width * 0.6,
                        height: 35,
                        decoration: basicInputDecoration(
                            hintStyle: kBottomSheetHintStyle(textTheme: textTheme),
                            hintText: "Nom du produit"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.31,
                    ),
                    Text(
                      "0",
                      style: textTheme.headline2,
                    ),
                    SizedBox(width: size.width * 0.02),
                    CustomIconButton(
                      press: () {},
                      icon: Icons.add_rounded,
                      size: const CustomIconButtonSize.small(),
                      circle: false,
                      outline: true,
                    ),
                    SizedBox(width: size.width * 0.02),
                    CustomIconButton( 
                      press: () {},
                      icon: Icons.remove_rounded,
                      size: const CustomIconButtonSize.small(),
                      circle: false,
                      outline: true,
                    ),
                    SizedBox(width: size.width * 0.02),
                    CustomTextField(
                        onChanged: (value) {
                          textFieldProvider.textValueOverride = value;
                        },
                        onSaved: (value) {},
                        validator: (value) {},
                        width: size.width * 0.35,
                        height: 35,
                        decoration: basicInputDecoration(
                            hintStyle: kBottomSheetHintStyle(textTheme: textTheme),
                            hintText: "Nom"),
                      ),
                  ]
                ),
                const Spacer(),
                CustomTextButton(
                  press: () {
                    if (textFieldProvider.textValueOverride.isNotEmpty) {
                      if (textFieldProvider.singleValue!.name != "Aucune") {
                        productListListForDropdown.add(ProductList(
                            listOfProduct:
                                textFieldProvider.singleValue!.listOfProduct,
                            name: textFieldProvider.textValue));
                      } else {
                        productListListForDropdown.add(ProductList(
                            listOfProduct: [],
                            name: textFieldProvider.textValue));
                      }
                      Navigator.pop(context);
                    }
                  },
                  text: "Ajouter",
                  isActive: textFieldProvider.textValueOverride.isNotEmpty,
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            right: 10,
            child: FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.close_rounded),
            ),
          ),
        ]),
      ),
    );
  }
}
