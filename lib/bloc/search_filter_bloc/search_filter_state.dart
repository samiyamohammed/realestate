import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_marketplace/models/properties_list_model.dart';

abstract class SearchFilterState extends Equatable {
  const SearchFilterState();

  @override
  List<Object?> get props => [];
}

class SearchFilterInitial extends SearchFilterState {}

class SearchFilterLoading extends SearchFilterState {}

class SearchFilterUpdated extends SearchFilterState {
  final List<Property> filteredProperties;
  final String selectedType;
  final String selectedSort;
  final String selectedSaleRent;
  final RangeValues priceRange;
  final int bedrooms;
  final int bathrooms;

  const SearchFilterUpdated({
    required this.filteredProperties,
    required this.selectedType,
    required this.selectedSort,
    required this.selectedSaleRent,
    required this.priceRange,
    required this.bedrooms,
    required this.bathrooms,
  });

  @override
  List<Object?> get props => [
        filteredProperties,
        selectedType,
        selectedSort,
        selectedSaleRent,
        priceRange,
        bedrooms,
        bathrooms,
      ];
}
