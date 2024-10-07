class MenuModel {
  final int id;
  final String name;
  final double price;
  final String currency;
  final int categoryId;

  const MenuModel({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.categoryId,
  });

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as double,
      currency: map['currency'] as String,
      categoryId: map['categoryId'] as int,
    );
  }

  @override
  int get hashCode => Object.hashAll([id, name, price, currency, categoryId]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is MenuModel && other.id == id;
  }
}
