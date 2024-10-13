import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/bloc_property/property_event.dart';
import 'package:real_estate_marketplace/bloc/bloc_property/property_state.dart';
import 'package:real_estate_marketplace/services/api/property/get_property_service.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  PropertyBloc() : super(PropertyInitialState()) {
    on<FetchedPropertyListEvent>((FetchedPropertyListEvent event, emit) async {
      final result = await GetPropertyService.getPropertyList();
      result.fold((l) => {
        emit(PropertyErrorState(message: l))
      }, (r)=>{
        emit(PropertyDataState(properties: r.properties))
      });
    });
  }
}
