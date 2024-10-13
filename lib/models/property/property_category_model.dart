class PropertyCategoryModel {
  int? id;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;

  PropertyCategoryModel(
      {this.id, this.title, this.description, this.createdAt, this.updatedAt});

  PropertyCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
