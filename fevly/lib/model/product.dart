import 'package:fevly/model/user_infos.dart';

enum QuantityUnit { none, L, cL, m, cm, pack, paquet, part }

class Product {
  final UserInfos fromUser;
  final String name;
  QuantityUnit unit;
  int quantity;

  Product({
    required this.fromUser,
    required this.name,
    required this.unit,
    this.quantity = 1,
  });
}
