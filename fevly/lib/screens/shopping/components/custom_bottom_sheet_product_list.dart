import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/general.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/view_models/text_field_model_view.dart';
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
      create: (context) => TextFieldModelView<ProductList>(),
      child: Consumer<TextFieldModelView<ProductList>>(
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
                  child: CustomTextField(
                    onChanged: (value) {
                      textFieldProvider.textValue = value;
                    },
                    onSaved: (value) {},
                    validator: (value) {},
                    width: size.width * 0.6,
                    height: 35,
                    decoration: basicInputDecoration(
                        hintStyle: kBottomSheetHintStyle(textTheme: textTheme),
                        hintText: "Nom de la liste"),
                  ),
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
                  child: DropdownButton<ProductList>(
                    value: textFieldProvider.value,
                    hint: textFieldProvider.value != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text((cast<ProductList>(textFieldProvider.value)!)
                                  .name),
                              SizedBox(
                                width: size.width * 0.2,
                              ),
                            ],
                          )
                        : const Text("Dupliquer une liste"),
                    icon: const Icon(Icons.expand_more_rounded),
                    elevation: 16,
                    style: textTheme.headline5,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (ProductList? newValue) {
                      textFieldProvider.value = newValue;
                    },
                    items: productListListForDropdown
                        .map<DropdownMenuItem<ProductList>>(
                            (ProductList? list) {
                      return DropdownMenuItem<ProductList>(
                        value: list,
                        child: Text(list != null ? list.name : "Aucune"),
                      );
                    }).toList(),
                  ),
                ),
                const Spacer(),
                CustomTextButton(
                  press: () {
                    if (textFieldProvider.textValue.isNotEmpty) {
                      if (textFieldProvider.value!.name != "Aucune") {
                        productListListForDropdown.add(ProductList(
                            listOfProduct:
                                textFieldProvider.value!.listOfProduct,
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
                  isActive: textFieldProvider.textValue.isNotEmpty,
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
