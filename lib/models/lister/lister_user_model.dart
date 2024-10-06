class ListerUserModel {
  final String? name;
  final String email;
  final String? phone;
  final String role;
  


  const ListerUserModel({
    this.name,
    required this.email,
    this.phone,
    this.role = 'user',
  });



  factory ListerUserModel.fromJson(Map<String, dynamic> json) => ListerUserModel(
    name: json['name'],
    email: json['email'],
    phone: json['phone'],
    role: json['role'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
    'role': role,
  };

  @override
  String toString() {
    return super.toString();
  }

}