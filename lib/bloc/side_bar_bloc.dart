import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart'; // Import the necessary package

abstract class YourBlocEvent {}

class NavigateToSettingsEvent extends YourBlocEvent {
  final BuildContext context;
  NavigateToSettingsEvent(this.context);
}

class NavigateToAddPropertyEvent extends YourBlocEvent {
  final BuildContext context;
  NavigateToAddPropertyEvent(this.context);
}

// Similarly for other events...

class YourBloc extends Bloc<YourBlocEvent, void> {
  YourBloc() : super(null);

  @override
  // ignore: override_on_non_overriding_member
  Stream<void> mapEventToState(YourBlocEvent event) async* {
    if (event is NavigateToSettingsEvent) {
      event.context.go('/settings');
    } else if (event is NavigateToAddPropertyEvent) {
      event.context.go('/add-property');
    }
    // Handle other events similarly...
  }
}
