import 'package:fevly/models/product.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/screens/product_list/components/body.dart';
import 'package:fevly/screens/product_list/components/custom_bottom_sheet.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/view_models/text_field_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key, required this.productList})
      : super(key: key);

  final ProductList productList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      body: Body(
        productList: productList,
      ),
      floatingActionButton: ChangeNotifierProvider(
        create: (context) => TextFieldModelView<Product>(
            value: Product(name: "", image: "", price: 0, quantity: 0)),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: size.height * 0.08,
          ),
          child: Consumer<TextFieldModelView<Product>>(
            builder: (context, textFieldProvider, child) =>
                FloatingActionButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => Stack(clipBehavior: Clip.none, children: [
                  CustomBottomSheet(
                    productList: productList,
                    textFieldProvider: textFieldProvider,
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
              backgroundColor: themeColor.primary,
              child: const Icon(Icons.add_rounded),
            ),
          ),
        ),
      ),
    );
  }
}
