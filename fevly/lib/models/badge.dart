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
  final String _name, _image;
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
    _quantity = newValue;
    notifyListeners();
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
}
