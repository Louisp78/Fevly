import 'package:fevly/models/badge.dart';

List<Badge> sortListBadgeBySearch(
    {required List<Badge> sourceList, required String search}) {
  if (search.isEmpty) return sourceList;
  final resList1 = sourceList
      .where((element) =>
          element.name.toLowerCase().contains(search.toLowerCase()))
      .toList();
  resList1.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  final resList2 = sourceList
      .where((element) => getBadgeTypeName(element.badgeType)
          .toLowerCase()
          .contains(search.toLowerCase()))
      .toList();
  return resList1 + resList2;
}
