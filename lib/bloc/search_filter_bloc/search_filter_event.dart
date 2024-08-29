import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SearchFilterEvent extends Equatable {
  const SearchFilterEvent();
}

class UpdateSearchQuery extends SearchFilterEvent {
  final String query;

  const UpdateSearchQuery(this.query);

  @override
  List<Object?> get props => [query];
}

class UpdateFilters extends SearchFilterEvent {
  final String selectedType;
  final String selectedSort;
  final String selectedSaleRent;
  final RangeValues priceRange;
  final int bedrooms;
  final int bathrooms;

  const UpdateFilters({
    required this.selectedType,
    required this.selectedSort,
    required this.selectedSaleRent,
    required this.priceRange,
    required this.bedrooms,
    required this.bathrooms,
  });

  @override
  List<Object?> get props => [
        selectedType,
        selectedSort,
        selectedSaleRent,
        priceRange,
        bedrooms,
        bathrooms,
      ];
}

class ClearFilters extends SearchFilterEvent {
  @override
  List<Object?> get props => [];
}
