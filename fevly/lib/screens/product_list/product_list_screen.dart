import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/general.dart';
import 'package:fevly/models/product.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/models/text_field_provider.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'components/body.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key, required this.productList})
      : super(key: key);

  final ProductList productList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Scaffold(
      body: Body(
        productList: productList,
      ),
      floatingActionButton: ChangeNotifierProvider(
        create: (context) => TextFieldProvider<Product>(
            value: Product(name: "", image: "", price: 0, quantity: 0)),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: size.height * 0.08,
          ),
          child: Consumer<TextFieldProvider<Product>>(
            builder: (context, textFieldProvider, child) =>
                FloatingActionButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => Stack(clipBehavior: Clip.none, children: [
                  Container(
                    alignment: Alignment.center,
                    height: textFieldProvider.selection
                        ? size.height
                        : size.height * 0.4,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.03),
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
                            "Ajouter un produit",
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
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                  vertical: size.width * 0.03,
                                ),
                                decoration: BoxDecoration(
                                  color: kSurfaceLightColor,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [kShadowBase],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.category_rounded,
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Text(
                                      "Catégorie",
                                      style: textTheme.headline6
                                          ?.copyWith(color: kTextColor),
                                      maxLines: 1,
                                    ),
                                    const SizedBox(
                                      height: 3.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Focus(
                              onFocusChange: (focus) =>
                                  textFieldProvider.selection = focus,
                              child: CustomTextField(
                                onChanged: (value) {
                                  textFieldProvider.textValueOverride = value;
                                },
                                onSaved: (value) {},
                                validator: (value) {},
                                width: size.width * 0.6,
                                height: 35,
                                decoration: basicInputDecoration(
                                    hintStyle: kBottomSheetHintStyle(
                                        textTheme: textTheme),
                                    hintText: "Nom du produit"),
                              ),
                            ),
                          ],
                        ),
                        Focus(
                          onFocusChange: (focus) =>
                              textFieldProvider.selection = focus,
                          child: CustomTextField(
                            onChanged: (value) {
                              textFieldProvider.textValueOverride = value;
                            },
                            onSaved: (value) {},
                            validator: (value) {},
                            width: size.width * 0.6,
                            height: 35,
                            decoration: basicInputDecoration(
                                hintStyle:
                                    kBottomSheetHintStyle(textTheme: textTheme),
                                hintText: "Nom "),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "0",
                              style: textTheme.headline2
                                  ?.copyWith(fontWeight: FontWeight.normal),
                            ),
                            CustomIconButton(
                              press: () {},
                              size: const CustomIconButtonSize.small(),
                              icon: Icons.add,
                              circle: false,
                              outline: true,
                            ),
                            CustomIconButton(
                              press: () {},
                              size: const CustomIconButtonSize.small(),
                              icon: Icons.remove_rounded,
                              circle: false,
                              outline: true,
                            ),
                            Container(
                              width: size.width * 0.6,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: kSurfaceLightColor,
                                  boxShadow: [kShadowBase]),
                              child: DropdownButton<QuantityUnit>(
                                value: QuantityUnit.none,
                                hint: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text((cast<Product>(
                                            textFieldProvider.value)!)
                                        .getQuantityUnitName()),
                                    SizedBox(
                                      width: size.width * 0.2,
                                    ),
                                  ],
                                ),
                                icon: const Icon(Icons.expand_more_rounded),
                                elevation: 16,
                                style: textTheme.headline5,
                                underline: Container(
                                  height: 0,
                                ),
                                onChanged: (QuantityUnit? newValue) {
                                  textFieldProvider.singleValue?.unit =
                                      newValue!;
                                },
                                items: QuantityUnit.values
                                    .map<DropdownMenuItem<QuantityUnit>>(
                                        (QuantityUnit unit) {
                                  return DropdownMenuItem<QuantityUnit>(
                                    value: unit,
                                    child: Text(unit != QuantityUnit.none
                                        ? unit.name
                                        : "Aucune"),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          width: size.width * 0.6,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: kSurfaceLightColor,
                              boxShadow: [kShadowBase]),
                        ),
                        const Spacer(),
                        CustomTextButton(
                          press: () {
                            productList.listOfProduct
                                .add(textFieldProvider.value!);

                            Navigator.pop(context);
                          },
                          text: "Ajouter",
                          isActive:
                              textFieldProvider.textValueOverride.isNotEmpty,
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
              backgroundColor: kPrimaryColor,
              child: const Icon(Icons.add_rounded),
            ),
          ),
        ),
      ),
    );
  }
}
