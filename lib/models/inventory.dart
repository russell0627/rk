import '../utils/utils.dart';

class InventoryItem {
  static const markUp = .2;

  final String name;
  final List<InventoryComponent> components;
  final int quantity;
  final String variation;

  const InventoryItem({
    required this.name,
    required this.components,
    this.quantity = 0,
    this.variation = "None",
  });

  InventoryItem copyWith({
    List<InventoryComponent>? components,
    int? quantity,
    String? variation,
  }) {
    return InventoryItem(
      name: name,
      components: components ?? this.components,
      quantity: quantity ?? this.quantity,
      variation: variation ?? this.variation,
    );
  }

  double get cost => components.sum();
  double get price => cost + (cost * markUp);
  double get totalPrice => price * quantity;

  @override
  String toString() => "\n$name\nCost: $cost\nPrice: ${price.toStringAsFixed(2)}\nQuantity: $quantity\nVariation: $variation\n";

}

class Inventory {
  final String name;
  final List<InventoryItem> items;

  const Inventory(this.name, this.items);

  InventoryItem findFirstItemByName(String name, List<InventoryItem> items) => items.firstWhere(
    (item) => item.name.toLowerCase() == name.toLowerCase(),
  );

  @override
  String toString() => items.toString();

}

class InventoryComponent {
  final String name;
  final double cost;

  const InventoryComponent(this.name, this.cost);
}

extension ComponentListX on List<InventoryComponent> {
  double sum() => map((value) => value.cost).sum();
}