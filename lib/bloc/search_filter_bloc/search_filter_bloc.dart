import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_marketplace/models/properties_list_model.dart';
import 'package:real_estate_marketplace/bloc/search_filter_bloc/search_filter_event.dart';
import 'package:real_estate_marketplace/bloc/search_filter_bloc/search_filter_state.dart';

class SearchFilterBloc extends Bloc<SearchFilterEvent, SearchFilterState> {
  List<Property> _allProperties = properties;

  SearchFilterBloc() : super(SearchFilterInitial()) {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(SearchFilterUpdated(
      filteredProperties: _allProperties,
      selectedType: 'All',
      selectedSort: 'Old to New',
      selectedSaleRent: 'All',
      priceRange: RangeValues(3000, 100000000),
      bedrooms: 0,
      bathrooms: 0,
    ));
    on<UpdateSearchQuery>(_onUpdateSearchQuery);
    on<UpdateFilters>(_onUpdateFilters);
    on<ClearFilters>(_onClearFilters);
    on<SaveSearchCriteriaEvent>(_onSaveSearchCriteria);
  }

  void _onUpdateSearchQuery(
      UpdateSearchQuery event, Emitter<SearchFilterState> emit) {
    List<Property> filteredProperties = _filterProperties(
      query: event.query,
    );
    emit(
      SearchFilterUpdated(
        filteredProperties: filteredProperties,
        selectedType: 'All',
        selectedSort: 'Old to New',
        selectedSaleRent: 'All',
        priceRange: RangeValues(3000, 100000000),
        bedrooms: 0,
        bathrooms: 0,
      ),
    );
  }

  void _onUpdateFilters(UpdateFilters event, Emitter<SearchFilterState> emit) {
    List<Property> filteredProperties = _filterProperties(
      selectedType: event.selectedType,
      selectedSort: event.selectedSort,
      selectedSaleRent: event.selectedSaleRent,
      priceRange: event.priceRange,
      bedrooms: event.bedrooms,
      bathrooms: event.bathrooms,
    );

    emit(
      SearchFilterUpdated(
        filteredProperties: filteredProperties,
        selectedType: event.selectedType,
        selectedSort: event.selectedSort,
        selectedSaleRent: event.selectedSaleRent,
        priceRange: event.priceRange,
        bedrooms: event.bedrooms,
        bathrooms: event.bathrooms,
      ),
    );
  }

  void _onClearFilters(ClearFilters event, Emitter<SearchFilterState> emit) {
    emit(SearchFilterUpdated(
      filteredProperties: _allProperties,
      selectedType: 'All',
      selectedSort: 'Old to New',
      selectedSaleRent: 'All',
      priceRange: RangeValues(3000, 100000000),
      bedrooms: 0,
      bathrooms: 0,
    ));
  }

  void _onSaveSearchCriteria(
      SaveSearchCriteriaEvent event, Emitter<SearchFilterState> emit) {
    // Logic to either save locally or send to backend
    print('Search Criteria Saved:');
    print('Type: ${event.selectedType}');
    print('Sort: ${event.selectedSort}');
    print('Sale/Rent: ${event.selectedSaleRent}');
    print('Price Range: ${event.priceRange.start} - ${event.priceRange.end}');
    print('Bedrooms: ${event.bedrooms}');
    print('Bathrooms: ${event.bathrooms}');
  }

  List<Property> _filterProperties({
    String? query,
    String? selectedType,
    String? selectedSort,
    String? selectedSaleRent,
    RangeValues? priceRange,
    int? bedrooms,
    int? bathrooms,
  }) {
    List<Property> filteredProperties = _allProperties;

    // Apply filters
    if (query != null && query.isNotEmpty) {
      filteredProperties = filteredProperties
          .where((property) => property.locationName
              .toLowerCase()
              .startsWith(query.toLowerCase()))
          .toList();
    }

    if (selectedType != null && selectedType != 'All') {
      filteredProperties = filteredProperties
          .where((property) => property.type == selectedType)
          .toList();
    }

    if (selectedSaleRent != null && selectedSaleRent != 'All') {
      filteredProperties = filteredProperties
          .where((property) => property.status == selectedSaleRent)
          .toList();
    }

    if (priceRange != null) {
      filteredProperties = filteredProperties
          .where((property) =>
              property.price >= priceRange.start &&
              property.price <= priceRange.end)
          .toList();
    }

    if (bedrooms != null && bedrooms > 0) {
      filteredProperties = filteredProperties
          .where((property) => property.bedroom == bedrooms)
          .toList();
    }

    if (bathrooms != null && bathrooms > 0) {
      filteredProperties = filteredProperties
          .where((property) => property.bathroom == bathrooms)
          .toList();
    }

    if (selectedSort != null) {
      if (selectedSort == 'Price (High to Low)') {
        filteredProperties.sort((a, b) => b.price.compareTo(a.price));
      } else if (selectedSort == 'Price (Low to High)') {
        filteredProperties.sort((a, b) => a.price.compareTo(b.price));
      } else if (selectedSort == 'Old to New') {
        filteredProperties.sort((a, b) => a.dateAdded.compareTo(b.dateAdded));
      } else if (selectedSort == 'New to Old') {
        filteredProperties.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
      }
    }

    return filteredProperties;
  }
}
