import 'product_model.dart';

class Category {
  final int? id;
  String category;
  String? imagePath;
  String? description;
  List<Product> listProducts;
  bool isActive;
  double? promotion;

  Category({
    this.id,
    required this.category,
    this.imagePath,
    this.description,
    this.promotion,
    List<Product>? listProducts,
    this.isActive = false,
  }) : listProducts = listProducts ?? [];

  @override
  toString() {
    return "\n{ id:$id >> $category \n isSelected: $isActive \n ListProducts: $listProducts } ";
  }

  isSelected() => isActive = !isActive;

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'status': isActive ? 1 : 0,
    };
  }
}
