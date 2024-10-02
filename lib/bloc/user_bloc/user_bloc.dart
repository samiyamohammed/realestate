import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/user_bloc/user_event.dart';
import 'package:real_estate_marketplace/models/auth_response_model.dart';
import 'package:real_estate_marketplace/models/user_model.dart';

class UserBloc extends Bloc<UserEvent, AuthResponse> {
  UserBloc()
      : super(AuthResponse(
            user: UserModel(
                name: '',
                email: '',
                googleId: '',
                avatar: '',
                updatedAt: DateTime.now(),
                createdAt: DateTime.now(),
                id: 0),
            token: '')) {
    on<UserIsLoggedIn>((event, emit) {
      emit(event.user);
    });
  }
}
