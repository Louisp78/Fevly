import 'package:fevly/constant/constant.dart';
import 'package:flutter/cupertino.dart';

//$ ENUMERATION
//$ ============================================================
/// Badge subEnum
enum BadgeCategory { danse, music, drink, cook, play, love }

extension BadgeCategoryExtension on BadgeCategory {
  String get name {
    switch (this) {
      case BadgeCategory.danse:
        return "danse";
      case BadgeCategory.cook:
        return "cuisine";
      case BadgeCategory.drink:
        return "boisson";
      case BadgeCategory.love:
        return "amour & séduction";
      case BadgeCategory.music:
        return "musique";
      case BadgeCategory.play:
        return "joueur";
    }
  }
}

/// Badge subEnum
enum BadgeType { wood, metal, gold, ruby, diamond, special }

extension BadgeTypeExtension on BadgeType {
  String get name {
    switch (this) {
      case BadgeType.wood:
        return "bois";
      case BadgeType.metal:
        return "métal";
      case BadgeType.gold:
        return "or";
      case BadgeType.ruby:
        return "rubis";
      case BadgeType.diamond:
        return "diamant";
      default:
        return "spécial";
    }
  }
}

//$ CLASS
//$ ============================================================
class Badge extends ChangeNotifier {
  final String _name;
  final String _image;
  final BadgeCategory _badgeCategory;
  final BadgeType _badgeType;
  int _quantity;

  Badge({
    int quantity = 1,
    required String image,
    required String name,
    required BadgeCategory badgeCategory,
    required BadgeType badgeType,
  })  : _image = image,
        _name = name,
        _quantity = quantity,
        _badgeCategory = badgeCategory,
        _badgeType = badgeType,
        assert(name.length < 25, "name is too long"),
        assert(quantity > 0, "quantity is positive & != 0");

  // *GETTER
  String get image => _image;
  String get name => _name;
  int get quantity => _quantity;
  BadgeCategory get badgeCategory => _badgeCategory;
  BadgeType get badgeType => _badgeType;

  // *SETTER
  set quantity(int newValue) {
    assert(newValue >= 0);

    _quantity = newValue;
    notifyListeners();
  }

  String get nameType {
    switch (_badgeType) {
      case BadgeType.wood:
        return "bois";
      case BadgeType.metal:
        return "métal";
      case BadgeType.gold:
        return "or";
      case BadgeType.ruby:
        return "rubis";
      case BadgeType.diamond:
        return "diamant";
      default:
        return kBadgeSpecialName(category: _badgeCategory);
    }
  }

  @override
  String toString() {
    return """
    name: $name,
    image: $image,
    badgeCategory: $badgeCategory,
    badgeType: $badgeType,
    quantity: $quantity,
    """;
  }

  //* DEFINED BADGES
  //* ================================================

  Badge.spatula({
    int quantity = 1,
    required BadgeType badgeType,
  })  : _image =
            "assets/badges/spatules_${_getBadgeTypeName(badgeCategory: BadgeCategory.cook, badgeType: badgeType)}.svg",
        _name = "Spatule",
        _quantity = quantity,
        _badgeCategory = BadgeCategory.cook,
        _badgeType = badgeType;

  Badge.sandal({
    int quantity = 1,
    required BadgeType badgeType,
  })  : _image =
            "assets/badges/sandale_${_getBadgeTypeName(badgeCategory: BadgeCategory.danse, badgeType: badgeType)}.svg",
        _name = "Sandale",
        _quantity = quantity,
        _badgeCategory = BadgeCategory.danse,
        _badgeType = badgeType;

  Badge.rose({
    int quantity = 1,
    required BadgeType badgeType,
  })  : _image =
            "assets/badges/rose_${_getBadgeTypeName(badgeCategory: BadgeCategory.love, badgeType: badgeType)}.svg",
        _name = "Rose",
        _quantity = quantity,
        _badgeCategory = BadgeCategory.love,
        _badgeType = badgeType;

  Badge.bottle({
    int quantity = 1,
    required BadgeType badgeType,
  })  : _image =
            "assets/badges/bouteille_${_getBadgeTypeName(badgeCategory: BadgeCategory.drink, badgeType: badgeType)}.svg",
        _name = "Bouteille",
        _quantity = quantity,
        _badgeCategory = BadgeCategory.drink,
        _badgeType = badgeType;

  Badge.lyre({
    int quantity = 1,
    required BadgeType badgeType,
  })  : _image =
            "assets/badges/lyre_${_getBadgeTypeName(badgeCategory: BadgeCategory.music, badgeType: badgeType)}.svg",
        _name = "Lyre",
        _quantity = quantity,
        _badgeCategory = BadgeCategory.music,
        _badgeType = badgeType;
}

//$ PRIVATE METHOD
//$ ===============================

String _getBadgeTypeName(
    {required BadgeType badgeType, required BadgeCategory badgeCategory}) {
  switch (badgeType) {
    case BadgeType.wood:
      return "bois";
    case BadgeType.metal:
      return "métal";
    case BadgeType.gold:
      return "or";
    case BadgeType.ruby:
      return "rubis";
    case BadgeType.diamond:
      return "diamant";
    default:
      return kBadgeSpecialNameNotForDisplay(category: badgeCategory);
  }
}
