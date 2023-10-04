class Product {
  final String? id;
  double discount;
  String imagePath;
  double price;
  String description;
  String supplier;
  String unit;
  String name;
  bool isActive;

  Product({
    this.id,
    this.name = '',
    this.isActive = true,
    this.imagePath = '',
    this.description = '',
    this.discount = 0,
    this.price = 0,
    this.supplier = '',
    this.unit = '',
  });

  @override
  toString() {
    return "\n{ id:$id >> $name// isSelected: $isActive } ";
  }

  isSelected() => isActive = !isActive;
}
