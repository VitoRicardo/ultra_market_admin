class Category {
  final int? id;
  final String category;
  bool isActive;
  int totalProducts;
  Category({
    this.id,
    required this.category,
    this.isActive = false,
    this.totalProducts = 0,
  });

  @override
  toString() {
    return "\n{ id:$id >> $category // isSelected: $isActive // CompleteTasks: $totalProducts } ";
  }

  isSelected() => isActive = !isActive;

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'status': isActive ? 1 : 0,
    };
  }
}
