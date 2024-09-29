import 'package:real_estate_marketplace/models/user_model.dart';

class AuthResponse {
  final UserModel user;
  final String token;

  AuthResponse({
    required this.user,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: UserModel.fromJson(json['user']),
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'token': token,
      };
}
