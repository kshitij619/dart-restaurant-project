class CategoryModel {
  final int categoryId;
  final String categoryName;
  final String description;

  const CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.description,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map['categoryId'] as int,
      categoryName: map['categoryName'] as String,
      description: map['description'] as String,
    );
  }
}
