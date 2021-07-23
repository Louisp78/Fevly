enum BadgeCategory { danse, music, drink, cook, play, love }
enum BadgeType { wood, metal, gold, ruby, diamond, special }

class Badge {
  final String name, image;
  final BadgeCategory badgeCategory;
  final BadgeType badgeType;

  Badge({
    required this.image,
    required this.name,
    required this.badgeCategory,
    required this.badgeType,
  }) : assert(name.length < 25, "name is too long");
}
