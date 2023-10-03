class Product {
  final int id;
  String name;
  bool isActive;

  Product({
    required this.id,
    this.name = '',
    this.isActive = true,
  });

  @override
  toString() {
    return "\n{ id:$id >> $name// isSelected: $isActive } ";
  }

  isSelected() => isActive = !isActive;
}
