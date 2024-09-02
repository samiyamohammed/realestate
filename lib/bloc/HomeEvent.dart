// ignore_for_file: file_names

abstract class HomeEvent {}

class HomeIndexChanged extends HomeEvent {
  final int index;

  HomeIndexChanged(this.index);
}
