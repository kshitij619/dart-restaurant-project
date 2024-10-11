class CategoryModel {
  final int categoryId;
  final String categoryName;
  final String description;

  const CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.description,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> jkb) {
    return CategoryModel(
      categoryId: jkb['categoryId'] as int,
      categoryName: jkb['categoryName'] as String,
      description: jkb['description'] as String,
    );
  }
}
