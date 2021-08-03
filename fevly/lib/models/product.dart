//$ ENUMERATION
//$ ============================================================

enum QuantityUnit { none, L, m, cm, pack, paquet, part }

extension QuantityUnitExtension on QuantityUnit {
  String get name {
    switch (this) {
      case QuantityUnit.paquet:
        return "paquet";
      case QuantityUnit.L:
        return "L";
      case QuantityUnit.cm:
        return "cm";
      case QuantityUnit.m:
        return "m";
      case QuantityUnit.pack:
        return "pack";
      case QuantityUnit.part:
        return "part";
      default:
        return "";
    }
  }
}

//$ CLASS
//$ ============================================================

class Product {
  String name;
  double price;
  double quantity;
  QuantityUnit unit;
  String image;

  Product(
      {required this.name,
      required this.image,
      required this.price,
      required this.quantity,
      this.unit = QuantityUnit.none})
      : assert(name.length < 18, "name of Product too long"),
        assert(quantity >= 0, "quanty of Product must be no-negative");
  @override
  String toString() {
    return """
    name: $name,
    price: $price,
    quantity: $quantity,
    unit: $unit,
    """;
  }

  String getQuantityUnitName() {
    switch (unit) {
      case QuantityUnit.paquet:
        return quantity > 1 ? "paquets" : "paquet";
      case QuantityUnit.L:
        return "L";
      case QuantityUnit.cm:
        return "cm";
      case QuantityUnit.m:
        return "m";
      case QuantityUnit.pack:
        return quantity > 1 ? "packs" : "pack";
      case QuantityUnit.part:
        return quantity > 1 ? "parts" : "part";
      default:
        return "";
    }
  }

  String getStringQuantity() {
    switch (unit) {
      case QuantityUnit.L:
      case QuantityUnit.cm:
      case QuantityUnit.m:
        return quantity.toStringAsFixed(1);
      default:
        return quantity.toStringAsFixed(0);
    }
  }
}
