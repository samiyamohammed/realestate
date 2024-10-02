part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCreateAccountRequested extends AuthEvent {
  final String name;
  final String email;
  final String number;
  final String password;
  final String passwordConfirmation;

  const AuthCreateAccountRequested(
      {required this.name,
      required this.email,
      required this.number,
      required this.password,
      required this.passwordConfirmation});
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginRequested({
    required this.email,
    required this.password,
  });
}

class AuthLogoutRequested extends AuthEvent {}
