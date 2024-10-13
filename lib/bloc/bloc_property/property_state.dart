import 'package:equatable/equatable.dart';
import 'package:real_estate_marketplace/models/property/property_model.dart';

abstract class PropertyState  extends Equatable{
  @override
  List<Object> get props => [];
}

class PropertyInitialState extends PropertyState {}

class PropertyLoadingState extends PropertyState {}


class PropertyDataState extends PropertyState {
  final List<PropertyModel> properties;

  PropertyDataState({required this.properties});

  @override
  List<Object> get props => [properties];
}


class PropertyErrorState extends PropertyState {
  final String message;
  PropertyErrorState({required this.message});
  @override
  List<Object> get props => [message];
}