enum BadgeCategory { danse, music, drink, cook, play, love }
enum BadgeType { wood, metal, gold, ruby, diamond, special }

String getBadgeTypeName(BadgeType type) {
  switch (type) {
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

class Badge {
  final String name, image;
  final BadgeCategory badgeCategory;
  final BadgeType badgeType;
  final int quantity;

  Badge({
    this.quantity = 1,
    required this.image,
    required this.name,
    required this.badgeCategory,
    required this.badgeType,
  }) : assert(name.length < 25, "name is too long");
}
