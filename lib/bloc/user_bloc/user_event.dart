import 'package:real_estate_marketplace/models/auth_response_model.dart';

class UserEvent {}

class UserIsLoggedIn extends UserEvent {
  final AuthResponse user;

  UserIsLoggedIn({required this.user});

   List<Object> get props => [user];
}
