// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_marketplace/bloc/search_filter_bloc/search_filter_bloc.dart';
import 'package:real_estate_marketplace/models/properties_list_model.dart';
import 'package:real_estate_marketplace/bloc/search_filter_bloc/search_filter_event.dart';
import 'package:real_estate_marketplace/bloc/search_filter_bloc/search_filter_state.dart';
import '../widgets/vertical_listing.dart';

class SearchAndFilterPage extends StatefulWidget {
  @override
  _SearchAndFilterPageState createState() => _SearchAndFilterPageState();
}

class _SearchAndFilterPageState extends State<SearchAndFilterPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      context
          .read<SearchFilterBloc>()
          .add(UpdateSearchQuery(_searchController.text));
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(() {});
    _searchController.dispose();
    super.dispose();
  }

  void _showFilterPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<SearchFilterBloc, SearchFilterState>(
          builder: (context, state) {
            print('Current state: $state');
            if (state is SearchFilterUpdated) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.9,
                        maxHeight: MediaQuery.of(context).size.height * 0.8,
                      ),
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: constraints.minHeight,
                                maxHeight: constraints.maxHeight,
                                minWidth: constraints.minWidth,
                                maxWidth: constraints.maxWidth,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ),
                                    Text(
                                      'Search Filter',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DropdownButtonFormField<String>(
                                          value: state.selectedType,
                                          decoration: InputDecoration(
                                            labelText: 'Property Type',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          items: [
                                            'All',
                                            'apartment',
                                            'land',
                                            'condo',
                                            'villa',
                                            'commercial'
                                          ].map((String type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              context
                                                  .read<SearchFilterBloc>()
                                                  .add(UpdateFilters(
                                                    selectedType: newValue!,
                                                    selectedSort:
                                                        state.selectedSort,
                                                    selectedSaleRent:
                                                        state.selectedSaleRent,
                                                    priceRange:
                                                        state.priceRange,
                                                    bedrooms: state.bedrooms,
                                                    bathrooms: state.bathrooms,
                                                  ));
                                            });
                                          },
                                        ),
                                        SizedBox(height: 16.0),
                                        DropdownButtonFormField<String>(
                                          value: state.selectedSort,
                                          decoration: InputDecoration(
                                            labelText: 'Sort by',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          items: [
                                            'High to Low(Price)',
                                            'Low to High(Price)',
                                            'Old to New',
                                            'New to Old'
                                          ].map((String sort) {
                                            return DropdownMenuItem<String>(
                                              value: sort,
                                              child: Text(sort),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              context
                                                  .read<SearchFilterBloc>()
                                                  .add(UpdateFilters(
                                                    selectedType:
                                                        state.selectedType,
                                                    selectedSort: newValue!,
                                                    selectedSaleRent:
                                                        state.selectedSaleRent,
                                                    priceRange:
                                                        state.priceRange,
                                                    bedrooms: state.bedrooms,
                                                    bathrooms: state.bathrooms,
                                                  ));
                                            });
                                          },
                                        ),
                                        SizedBox(height: 16.0),
                                        DropdownButtonFormField<String>(
                                          value: state.selectedSaleRent,
                                          decoration: InputDecoration(
                                            labelText: 'Sale/Rent',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          items: [
                                            'All',
                                            'For Sale',
                                            'For Rent',
                                            'Sold'
                                          ].map((String option) {
                                            return DropdownMenuItem<String>(
                                              value: option,
                                              child: Text(option),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              context
                                                  .read<SearchFilterBloc>()
                                                  .add(UpdateFilters(
                                                    selectedType:
                                                        state.selectedType,
                                                    selectedSort:
                                                        state.selectedSort,
                                                    selectedSaleRent: newValue!,
                                                    priceRange:
                                                        state.priceRange,
                                                    bedrooms: state.bedrooms,
                                                    bathrooms: state.bathrooms,
                                                  ));
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.0),
                                    Text('Price Range'),
                                    RangeSlider(
                                      values: state.priceRange,
                                      min: 3000,
                                      max: 100000000,
                                      divisions: null,
                                      labels: RangeLabels(
                                        '${state.priceRange.start.round()}',
                                        '${state.priceRange.end.round()}',
                                      ),
                                      onChanged: (RangeValues values) {
                                        setState(() {
                                          double minValue = values.start;
                                          double maxValue = values.end;
                                          double commonPoint = 1000000;
                                          // for min value
                                          if (minValue < commonPoint) {
                                            double step =
                                                1000; // Small to reach common point
                                            minValue =
                                                (minValue ~/ step) * step;
                                          } else {
                                            double step =
                                                20000; // Big step after reaching common point
                                            minValue =
                                                (minValue ~/ step) * step;
                                          }
                                          // for max value
                                          if (maxValue > commonPoint) {
                                            double step =
                                                20000; // Big step after reaching common point
                                            maxValue =
                                                (maxValue ~/ step) * step;
                                          } else {
                                            double step =
                                                1000; // Small to reach common point
                                            maxValue =
                                                (maxValue ~/ step) * step;
                                          }
                                          // Prevent overlap
                                          if (minValue >= commonPoint &&
                                              maxValue <= commonPoint) {
                                            minValue = commonPoint;
                                            maxValue = commonPoint;
                                          }
                                          context
                                              .read<SearchFilterBloc>()
                                              .add(UpdateFilters(
                                                selectedType:
                                                    state.selectedType,
                                                selectedSort:
                                                    state.selectedSort,
                                                selectedSaleRent:
                                                    state.selectedSaleRent,
                                                priceRange: RangeValues(
                                                    minValue, maxValue),
                                                bedrooms: state.bedrooms,
                                                bathrooms: state.bathrooms,
                                              ));
                                        });
                                      },
                                      activeColor: Colors.green,
                                      inactiveColor: Colors.grey,
                                    ),
                                    SizedBox(height: 16.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Number of Bedrooms'),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.add_circle,
                                                  color: Color.fromARGB(
                                                      255, 91, 53, 175)),
                                              onPressed: () {
                                                setState(() {
                                                  context
                                                      .read<SearchFilterBloc>()
                                                      .add(UpdateFilters(
                                                        selectedType:
                                                            state.selectedType,
                                                        selectedSort:
                                                            state.selectedSort,
                                                        selectedSaleRent: state
                                                            .selectedSaleRent,
                                                        priceRange:
                                                            state.priceRange,
                                                        bedrooms:
                                                            state.bedrooms + 1,
                                                        bathrooms:
                                                            state.bathrooms,
                                                      ));
                                                });
                                              },
                                            ),
                                            Text('${state.bedrooms}'),
                                            IconButton(
                                              icon: Icon(Icons.remove_circle,
                                                  color: Color.fromARGB(
                                                      255, 91, 53, 175)),
                                              onPressed: () {
                                                setState(() {
                                                  context
                                                      .read<SearchFilterBloc>()
                                                      .add(UpdateFilters(
                                                        selectedType:
                                                            state.selectedType,
                                                        selectedSort:
                                                            state.selectedSort,
                                                        selectedSaleRent: state
                                                            .selectedSaleRent,
                                                        priceRange:
                                                            state.priceRange,
                                                        bedrooms: state
                                                                    .bedrooms >
                                                                0
                                                            ? state.bedrooms - 1
                                                            : 0,
                                                        bathrooms:
                                                            state.bathrooms,
                                                      ));
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Number of Bathrooms'),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.add_circle,
                                                  color: Color.fromARGB(
                                                      255, 91, 53, 175)),
                                              onPressed: () {
                                                setState(() {
                                                  context
                                                      .read<SearchFilterBloc>()
                                                      .add(UpdateFilters(
                                                        selectedType:
                                                            state.selectedType,
                                                        selectedSort:
                                                            state.selectedSort,
                                                        selectedSaleRent: state
                                                            .selectedSaleRent,
                                                        priceRange:
                                                            state.priceRange,
                                                        bedrooms:
                                                            state.bedrooms,
                                                        bathrooms:
                                                            state.bathrooms + 1,
                                                      ));
                                                });
                                              },
                                            ),
                                            Text('${state.bathrooms}'),
                                            IconButton(
                                              icon: Icon(Icons.remove_circle,
                                                  color: Color.fromARGB(
                                                      255, 91, 53, 175)),
                                              onPressed: () {
                                                setState(() {
                                                  context
                                                      .read<SearchFilterBloc>()
                                                      .add(UpdateFilters(
                                                        selectedType:
                                                            state.selectedType,
                                                        selectedSort:
                                                            state.selectedSort,
                                                        selectedSaleRent: state
                                                            .selectedSaleRent,
                                                        priceRange:
                                                            state.priceRange,
                                                        bedrooms:
                                                            state.bedrooms,
                                                        bathrooms: state
                                                                    .bathrooms >
                                                                0
                                                            ? state.bathrooms -
                                                                1
                                                            : 0,
                                                      ));
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all<
                                                      Color>(Colors.white),
                                              shape: WidgetStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  side: BorderSide(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<SearchFilterBloc>()
                                                  .add(ClearFilters());
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Clear',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all<
                                                          Color>(
                                                      Color.fromARGB(
                                                          255, 91, 53, 175)),
                                              shape: WidgetStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Search',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFilterBloc, SearchFilterState>(
      builder: (context, state) {
        if (state is SearchFilterInitial) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Search',
                style: GoogleFonts.roboto(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
              leading: BackButton(),
            ),
          );
        } else if (state is SearchFilterUpdated) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Search',
                style: GoogleFonts.roboto(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
              leading: BackButton(),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50.0,
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search by location name or address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              prefixIcon: Icon(Icons.search),
                              suffixIcon: Icon(Icons.map),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15.0),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      SizedBox(
                        height: 48.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                                Color.fromARGB(255, 255, 255, 255)),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  width: 0.7,
                                ),
                              ),
                            ),
                          ),
                          onPressed: _showFilterPopup,
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.filter_list,
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                                SizedBox(width: 8.0),
                                Text(
                                  'Filter',
                                  style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 64, 62, 62),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.filteredProperties.length,
                      itemBuilder: (context, index) {
                        return PropertyCard(
                          property: state.filteredProperties[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(child: Text('Unexpected State')),
        );
      },
    );
  }
}
