
class PropertyCategoryModel {
  final List<PropertyCategory> data;

  PropertyCategoryModel({required this.data});

  // Factory method to create a PropertyCategoryModel from JSON
  factory PropertyCategoryModel.fromJson(Map<String, dynamic> json) {
    return PropertyCategoryModel(
      data: (json['data'] as List)
          .map((item) => PropertyCategory.fromJson(item))
          .toList(),
    );
  }

  // Method to convert PropertyCategoryModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((category) => category.toJson()).toList(),
    };
  }
}

class PropertyCategory {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  PropertyCategory({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create a PropertyCategory from JSON
  factory PropertyCategory.fromJson(Map<String, dynamic> json) {
    return PropertyCategory(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert PropertyCategory to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
