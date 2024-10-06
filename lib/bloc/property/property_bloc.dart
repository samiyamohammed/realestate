import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/property/property_event.dart';
import 'package:real_estate_marketplace/models/property/property_model.dart';

class PropertyBloc extends Bloc<PropertyEvent, List<PropertyModel>> {
  PropertyBloc() : super([]) {
    on<FetchedPropertyListEvent>((event, emit) async {
      emit(event.properties);
    });
  }
}
