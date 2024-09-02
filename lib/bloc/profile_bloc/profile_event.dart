// ignore_for_file: unused_import

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {}

class DeactivateAccount extends ProfileEvent {}

class ChangePassword extends ProfileEvent {
  final String currentPassword;

  ChangePassword(this.currentPassword);

  @override
  List<Object?> get props => [currentPassword];
}

class LogOutUser extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final String name;
  final String email;
  final String phonenumber;
  final String bio;
  final String image;
  final String status;

  const UpdateProfile({
    required this.name,
    required this.email,
    required this.phonenumber,
    required this.bio,
    required this.image,
    required this.status,
  });

  @override
  List<Object?> get props => [name, email, phonenumber, bio, image, status];
}

class SubmitNewPassword extends ProfileEvent {
  final String newPassword;
  final String confirmPassword;

  SubmitNewPassword(this.newPassword, this.confirmPassword);

  @override
  List<Object?> get props => [newPassword, confirmPassword];
}

class ValidatePassword extends ProfileEvent {
  final String enteredPassword;

  const ValidatePassword(this.enteredPassword);

  @override
  List<Object> get props => [enteredPassword];
}
