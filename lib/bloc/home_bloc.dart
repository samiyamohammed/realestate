import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/HomeState.dart';

// events/home_event.dart
abstract class HomeEvent {}

class HomeIndexChanged extends HomeEvent {
  final int index;

  HomeIndexChanged(this.index);
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    // Registering the event handler for HomeIndexChanged
    on<HomeIndexChanged>((event, emit) {
      emit(HomeLoaded(selectedIndex: event.index));
    });
  }
}
