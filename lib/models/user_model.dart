class UserModel {
  final String name;
  final String email;
  final String googleId;
  final String avatar;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  UserModel({
    required this.name,
    required this.email,
    required this.googleId,
    required this.avatar,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        email: json['email'],
        googleId: json['google_id'],
        avatar: json['avatar'],
        updatedAt: DateTime.parse(json['updated_at']),
        createdAt: DateTime.parse(json['created_at']),
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'google_id': googleId,
        'avatar': avatar,
        'updated_at': updatedAt.toIso8601String(),
        'created_at': createdAt.toIso8601String(),
        'id': id,
      };
}
