import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/models/demo_users.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<DeactivateAccount>(_onDeactivateAccount);
    on<ChangePassword>(_onChangePassword);
    on<UpdateProfile>(_onUpdateProfile);
    on<LogOutUser>(_onLogOutUser);
    on<ValidatePassword>(_onValidatePassword);
    on<SubmitNewPassword>(_onSubmitNewPassword);
  }

  void _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final Users user = demousers.first;
      emit(ProfileLoaded(
          name: user.name,
          email: user.email,
          phonenumber: user.phonenumber,
          image: user.image,
          status: user.status,
          bio: user.bio));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  void _onDeactivateAccount(
      DeactivateAccount event, Emitter<ProfileState> emit) {}

  void _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) {
    //  profile update logic
  }

  void _onLogOutUser(LogOutUser event, Emitter<ProfileState> emit) {
    //  user log out logic
  }

  void _onChangePassword(
      ChangePassword event, Emitter<ProfileState> emit) async {
    emit(PasswordValidating());
    try {
      bool isPasswordCorrect =
          await _validateCurrentPassword(event.currentPassword);

      if (isPasswordCorrect) {
        emit(NewPasswordInput());
      } else {
        emit(PasswordValidationFailure('Current password is incorrect'));
      }
    } catch (e) {
      emit(PasswordValidationFailure(e.toString()));
    }
  }

  void _onSubmitNewPassword(
      SubmitNewPassword event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      if (event.newPassword == event.confirmPassword) {
        await _updatePassword(event.newPassword);
        emit(PasswordChangeSuccess());
      } else {
        emit(PasswordChangeFailure('New passwords do not match'));
      }
    } catch (e) {
      emit(PasswordChangeFailure(e.toString()));
    }
  }

  void _onValidatePassword(
      ValidatePassword event, Emitter<ProfileState> emit) async {
    emit(PasswordValidating());
    try {
      final Users user = demousers.first;
      bool isPasswordCorrect = user.password == event.enteredPassword;

      if (isPasswordCorrect) {
        emit(PasswordValidationSuccess());
      } else {
        emit(PasswordValidationFailure('Current password is incorrect'));
      }
    } catch (e) {
      emit(PasswordValidationFailure(e.toString()));
    }
  }

  Future<bool> _validateCurrentPassword(String currentPassword) async {
    await Future.delayed(Duration(seconds: 1)); // to simulate network delay
    final user = demousers.first;
    return user.password == currentPassword;
  }

  Future<void> _updatePassword(String newPassword) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    final user = demousers.first;
    user.password = newPassword; // Update
  }
}
