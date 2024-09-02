// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String name;
  final String email;
  final String phonenumber;
  final String image;
  final String status;
  final String bio;

  const ProfileLoaded({
    required this.name,
    required this.email,
    required this.phonenumber,
    required this.image,
    required this.status,
    required this.bio,
  });

  @override
  List<Object?> get props => [name, email, phonenumber, bio, image, status];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}

class PasswordInitial extends ProfileState {}

class PasswordLoading extends ProfileState {}

class PasswordValidating extends ProfileState {}

class PasswordValidationSuccess extends ProfileState {}

class PasswordValidated extends ProfileState {
  final bool isValid;

  const PasswordValidated(this.isValid);

  @override
  List<Object?> get props => [isValid];
}

class PasswordValidationFailure extends ProfileState {
  final String errorMessage;

  const PasswordValidationFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class PasswordChangeRequested extends ProfileState {}

class NewPasswordInput extends ProfileState {}

class PasswordChangeSuccess extends ProfileState {}

class PasswordChangeFailure extends ProfileState {
  final String errorMessage;

  const PasswordChangeFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
