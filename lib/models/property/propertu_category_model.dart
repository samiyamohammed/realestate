class PropertyCategoryModel {
  final int id;
  final String? subCategory;
  final String? category;
  final String? categoryDescription;
  final String? subCategoryDescription;

  const PropertyCategoryModel({
    required this.id,
    this.subCategory,
    this.category,
    this.categoryDescription,
    this.subCategoryDescription,
  });

  factory PropertyCategoryModel.fromJson(Map<String, dynamic> json) => PropertyCategoryModel(
    id: json['id'],
    subCategory: json['Property_subcategory_name'],
    category: json['property_category']['title'],
    categoryDescription: json['property_category']['description'],
    subCategoryDescription: json['Property_subcategory_description'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'sub_category': subCategory,
    'category': category,
    'category_description': categoryDescription,
    'sub_category_description': subCategoryDescription,
  };

  @override
  String toString() {
    return 'PropertyCategoryModel(id: $id, subCategory: $subCategory, category: $category, categoryDescription: $categoryDescription, subCategoryDescription: $subCategoryDescription)';
  }
}
