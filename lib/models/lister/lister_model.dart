class ListerModel {
  int? id;
  User? user;
  String? agencyName;
  String? isVerified;
  String? bio;
  String? license;
  String? isVisible;
  String? status;
  String? createdAt;
  String? updatedAt;

  ListerModel(
      {this.id,
      required this.user,
      this.agencyName,
      this.isVerified,
      this.bio,
      this.license,
      this.isVisible,
      this.status,
      this.createdAt,
      this.updatedAt});

  ListerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = User.fromJson(json['user']);
    agencyName = json['agency_name'];
    isVerified = json['is_verified'];
    bio = json['bio'];
    license = json['license'];
    isVisible = json['is_visible'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['agency_name'] = this.agencyName;
    data['is_verified'] = this.isVerified;
    data['bio'] = this.bio;
    data['license'] = this.license;
    data['is_visible'] = this.isVisible;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? role;

  User({this.name, this.email, this.phone, this.avatar, this.role});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['role'] = this.role;
    return data;
  }
}
