part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthCreateAccountFailure extends AuthState {
  final String errorMessage;
  const AuthCreateAccountFailure(this.errorMessage);
}

final class AuthCreateAccountSuccess extends AuthState {}

final class AuthLoginSuccess extends AuthState {}

final class AuthLoginFailure extends AuthState {
  final String errorMessage;
  const AuthLoginFailure(this.errorMessage);
}
