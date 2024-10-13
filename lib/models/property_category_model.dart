class PropertyCategoryModel {
  final int? id;
  final String? title;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PropertyCategoryModel({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  // Factory method to create a PropertyCategoryModel from JSON
  factory PropertyCategoryModel.fromJson(Map<String, dynamic> json) {
    return PropertyCategoryModel(
      id: json['id'] is int ? json['id'] as int : null,
      title: json['title'] as String?,
      description: json['description'] as String?,
      createdAt:
          json['created_at'] != null ? _parseDate(json['created_at']) : null,
      updatedAt:
          json['updated_at'] != null ? _parseDate(json['updated_at']) : null,
    );
  }

  // Method to convert PropertyCategory to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  // Helper method to parse date strings safely
  static DateTime? _parseDate(dynamic dateStr) {
    if (dateStr is String) {
      try {
        return DateTime.parse(dateStr);
      } catch (e) {
        // Log the error or handle it as needed
        print('Date parsing error: $e');
        return null;
      }
    }
    return null;
  }
}
