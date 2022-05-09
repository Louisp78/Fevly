import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/functions/general.dart';
import 'package:fevly/models/product.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:fevly/styles/theme.dart';
import 'package:fevly/view_models/text_field_model_view.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {Key? key, required this.productList, required this.textFieldProvider})
      : super(key: key);

  final ProductList productList;
  final TextFieldModelView<Product> textFieldProvider;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Container(
      alignment: Alignment.center,
      height: textFieldProvider.selection ? size.height : size.height * 0.4,
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
                        style: textTheme.headline6?.copyWith(color: kTextColor),
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
                onFocusChange: (focus) => textFieldProvider.selection = focus,
                child: CustomTextField(
                  onChanged: (value) {
                    textFieldProvider.textValue = value;
                  },
                  onSaved: (value) {},
                  validator: (value) {},
                  width: size.width * 0.6,
                  height: 35,
                  hintStyle: kBottomSheetHintStyle(textTheme: textTheme),
                  hintText: "Nom du produit",
                ),
              ),
            ],
          ),
          Focus(
            onFocusChange: (focus) => textFieldProvider.selection = focus,
            child: CustomTextField(
              onChanged: (value) {
                textFieldProvider.textValue = value;
              },
              onSaved: (value) {},
              validator: (value) {},
              width: size.width * 0.6,
              height: 35,
              hintStyle: kBottomSheetHintStyle(textTheme: textTheme),
              hintText: "Nom ",
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
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kSurfaceLightColor,
                    boxShadow: [kShadowBase]),
                child: DropdownButton<QuantityUnit>(
                  value: QuantityUnit.none,
                  hint: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text((cast<Product>(textFieldProvider.value)!)
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
                    textFieldProvider.value?.unit = newValue!;
                  },
                  items: QuantityUnit.values
                      .map<DropdownMenuItem<QuantityUnit>>((QuantityUnit unit) {
                    return DropdownMenuItem<QuantityUnit>(
                      value: unit,
                      child: Text(
                          unit != QuantityUnit.none ? unit.name : "Aucune"),
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
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kSurfaceLightColor,
                boxShadow: [kShadowBase]),
          ),
          const Spacer(),
          CustomTextButton(
            press: () {
              productList.listOfProduct.add(textFieldProvider.value!);

              Navigator.pop(context);
            },
            text: "Ajouter",
            isActive: textFieldProvider.textValue.isNotEmpty,
          ),
        ],
      ),
    );
  }
}
