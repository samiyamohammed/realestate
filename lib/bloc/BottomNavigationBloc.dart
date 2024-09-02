import 'package:flutter_bloc/flutter_bloc.dart';

// Define the events
abstract class BottomNavigationEvent {}

class NavigationItemSelected extends BottomNavigationEvent {
  final int index;

  NavigationItemSelected(this.index);
}

// Define the states
abstract class BottomNavigationState {}

class BottomNavigationInitial extends BottomNavigationState {}

class BottomNavigationUpdated extends BottomNavigationState {
  final int selectedIndex;

  BottomNavigationUpdated(this.selectedIndex);
}

// Define the bloc
class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationInitial());

  @override
  // ignore: override_on_non_overriding_member
  Stream<BottomNavigationState> mapEventToState(BottomNavigationEvent event) async* {
    if (event is NavigationItemSelected) {
      yield BottomNavigationUpdated(event.index);
    }
  }
}





// ignore_for_file: file_names

