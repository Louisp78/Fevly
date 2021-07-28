enum QuantityUnit { L, pack, paquet, m, cm }

class Product {
  final String name;
  final double price;
  final double quantity;
  final QuantityUnit? unit;

  Product(
      {required this.name,
      required this.price,
      required this.quantity,
      this.unit})
      : assert(name.length < 25, "name of Product too long"),
        assert(quantity >= 0, "quanty of Product must be no-negative");
  @override
  String toString() {
    // TODO: implement toString
    return """
    name: $name,
    price: $price,
    quantity: $quantity,
    unit: $unit,
    """;
  }
}
