import 'package:real_estate_marketplace/models/property/property_model.dart';

sealed class PropertyEvent {}


class FetchedPropertyListEvent extends PropertyEvent {
  final List<PropertyModel> properties;
  FetchedPropertyListEvent(this.properties);
}