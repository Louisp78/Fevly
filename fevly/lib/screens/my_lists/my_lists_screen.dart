import 'package:fevly/models/guest_list.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/screens/my_lists/components/body.dart';
import 'package:flutter/material.dart';

class MyListsScreen extends StatelessWidget {
  const MyListsScreen({
    Key? key,
    required this.listOfProductList,
    required this.listOfGuestList,
  }) : super(key: key);

  final List<ProductList> listOfProductList;
  final List<GuestList> listOfGuestList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        listOfGuestList: listOfGuestList,
        listOfProductList: listOfProductList,
      ),
    );
  }
}
