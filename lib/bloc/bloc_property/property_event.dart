import 'package:real_estate_marketplace/models/property/property_model.dart';

abstract class PropertyEvent {}



class FetchedPropertyListEvent extends PropertyEvent {


  FetchedPropertyListEvent();
}