import 'package:fevly/models/badge.dart';
import 'package:test/test.dart';
void main()
{
  group("Badge tests", () {
  Badge badge = Badge(image: "", name: "a badge", badgeCategory: BadgeCategory.danse, badgeType: BadgeType.diamond);
    test("categorie", () {
      expect(badge.badgeCategory, BadgeCategory.danse);
    });
    test("name", () {
      expect(badge.name, "a badge");
    });
    test("name_type", () {
      expect(badge.nameType, "diamant");
    });
    test("type", () {
      expect(badge.badgeType, BadgeType.diamond);
    });
    test("quantity", () {
      expect(badge.quantity, 1);
    });
    test("quantity_failed", () {
      expect(() {badge.quantity = -1;}, throwsA(isA<AssertionError>()));
    });
    test("quantity_failed2", () {
      expect(() {badge = Badge(quantity: -9, image: "", name: "loremipsum ", badgeCategory: BadgeCategory.danse, badgeType: BadgeType.diamond);}, throwsA(isA<AssertionError>()));
    });
    test("name_failed", () {
      expect(() {badge = Badge(image: "", name: "loremipsum mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", badgeCategory: BadgeCategory.danse, badgeType: BadgeType.diamond);}, throwsA(isA<AssertionError>()));
    });
  });

}
