import 'package:fevly/models/badge.dart';
import 'package:fevly/models/product.dart';
import 'package:fevly/models/user.dart';

List<Badge> sortListBadgeBySearch(
    {required List<Badge> sourceList, required String search}) {
  if (search.isEmpty) return sourceList;
  final resList1 = sourceList
      .where((element) =>
          element.name.toLowerCase().contains(search.toLowerCase()))
      .toList();
  resList1.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  final resList2 = sourceList
      .where((element) =>
          element.badgeType.name.toLowerCase().contains(search.toLowerCase()))
      .toList();
  return resList1 + resList2;
}

List<Product> sortListProductBySearch(
    {required List<Product> sourceList, required String search}) {
  if (search.isEmpty) return sourceList;
  final resList1 = sourceList
      .where((element) =>
          element.name.toLowerCase().contains(search.toLowerCase()))
      .toList();
  resList1.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  return resList1;
}

List<User> sortListUserBySearch(
    {required List<User> sourceList, required String search}) {
  if (search.isEmpty) return sourceList;
  final resList1 = sourceList
      .where((element) =>
          element.pseudo.toLowerCase().contains(search.toLowerCase()))
      .toList();
  resList1
      .sort((a, b) => a.pseudo.toLowerCase().compareTo(b.pseudo.toLowerCase()));
  return resList1;
}
