import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/product.dart';
import 'package:fevly/screens/party/model_views/model_view_party.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomBottomSheetAddProduct extends StatelessWidget {
  const CustomBottomSheetAddProduct({
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
      create: (context) => ModelViewParty(),
      child: Consumer<ModelViewParty>(
        builder: (context, modelViewShopping, child) =>
            Stack(clipBehavior: Clip.none, children: [
          Container(
            alignment: Alignment.center,
            height:
                modelViewShopping.selection ? size.height : size.height * 0.4,
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
                if (modelViewShopping.selection)
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                if (!modelViewShopping.selection) const Spacer(),
                Focus(
                  onFocusChange: (focus) => modelViewShopping.selection = focus,
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
                            padding: EdgeInsets.symmetric(
                                vertical: size.width * 0.02),
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
                                  style: textTheme.headline5
                                      ?.copyWith(color: kDarkerTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      CustomTextField(
                        onChanged: (value) {
                          modelViewShopping.textField = value;
                        },
                        onSaved: (value) {},
                        validator: (value) {},
                        width: size.width * 0.6,
                        height: 35,
                        decoration: basicInputDecoration(
                            hintStyle:
                                kBottomSheetHintStyle(textTheme: textTheme),
                            hintText: "Nom du produit"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(children: [
                  SizedBox(
                    width: size.width * 0.25,
                  ),
                  Text(
                    modelViewShopping.count.toString(),
                    style: textTheme.headline2,
                  ),
                  SizedBox(width: size.width * 0.02),
                  CustomIconButton(
                    press: () => modelViewShopping.count += 1,
                    icon: Icons.add_rounded,
                    size: const CustomIconButtonSize.small(),
                    circle: false,
                    outline: true,
                  ),
                  SizedBox(width: size.width * 0.02),
                  CustomIconButton(
                    press: () => modelViewShopping.count == 0
                        ? {}
                        : modelViewShopping.count -= 1,
                    icon: Icons.remove_rounded,
                    size: const CustomIconButtonSize.small(),
                    circle: false,
                    outline: true,
                  ),
                  SizedBox(width: size.width * 0.02),
                  Container(
                    width: size.width * 0.35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kSurfaceLightColor,
                        boxShadow: [kShadowBase]),
                    child: DropdownButton<QuantityUnit>(
                      value: modelViewShopping.category,
                      hint: SizedBox(
                        width: size.width * 0.3 - 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              modelViewShopping.category != null
                                  ? modelViewShopping.category!.name
                                  : "Ajouter",
                              maxLines: 1,
                              style: modelViewShopping.category != null
                                  ? textTheme.headline5
                                  : textTheme.headline5
                                      ?.copyWith(color: kPrimaryColor),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      icon: const Icon(Icons.expand_more_rounded),
                      elevation: 16,
                      style: textTheme.headline5,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (QuantityUnit? newValue) {
                        modelViewShopping.category = newValue;
                      },
                      items: [...QuantityUnit.values]
                          .map<DropdownMenuItem<QuantityUnit>>(
                              (QuantityUnit? unit) {
                        return DropdownMenuItem<QuantityUnit>(
                          value: unit,
                          child: Text(
                            unit == QuantityUnit.none ? "Aucun" : unit!.name,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ]),
                const Spacer(),
                CustomTextButton(
                  press: () {},
                  text: "Ajouter",
                  isActive: modelViewShopping.count != 0 &&
                      modelViewShopping.textField != "" &&
                      modelViewShopping.category != null,
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
