// ignore_for_file: file_names

// states/home_state.dart
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final int selectedIndex;

  HomeLoaded({required this.selectedIndex});
}

