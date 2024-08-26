import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_marketplace/models/properties_list_model.dart';
import 'package:real_estate_marketplace/widgets/vertical_listing.dart';

class SearchAndFilterPage extends StatefulWidget {
  @override
  _SearchAndFilterPageState createState() => _SearchAndFilterPageState();
}

class _SearchAndFilterPageState extends State<SearchAndFilterPage> {
  String _selectedType = 'All';
  String _selectedSort = 'Price (High to Low)';
  String _selectedSaleRent = 'All';
  RangeValues _priceRange = RangeValues(3000, 100000000);
  int _bedrooms = 0;
  int _bathrooms = 0;
  List<Property> _filteredProperties = [];
  TextEditingController _searchController = TextEditingController();

  void _filterProperties() {
    setState(() {
      String searchQuery = _searchController.text.toLowerCase();

      _filteredProperties = properties.where((property) {
        bool matchesType =
            _selectedType == 'All' || property.type == _selectedType;

        bool matchesStatus =
            _selectedSaleRent == 'All' || property.status == _selectedSaleRent;

        bool matchesPrice = property.price >= _priceRange.start &&
            property.price <= _priceRange.end;

        bool matchesBedrooms = property.bedroom >= _bedrooms;

        bool matchesBathrooms = property.bathroom >= _bathrooms;

        bool matchesLocation =
            property.locationName.toLowerCase().contains(searchQuery);

        return matchesType &&
            matchesStatus &&
            matchesPrice &&
            matchesBedrooms &&
            matchesBathrooms &&
            matchesLocation;
      }).toList();

      if (_selectedSort == 'Price (High to Low)') {
        _filteredProperties.sort((a, b) => b.price.compareTo(a.price));
      } else if (_selectedSort == 'Price (Low to High)') {
        _filteredProperties.sort((a, b) => a.price.compareTo(b.price));
      } else if (_selectedSort == 'Old to New') {
        _filteredProperties.sort((a, b) => a.dateAdded.compareTo(b.dateAdded));
      } else if (_selectedSort == 'New to Old') {
        _filteredProperties.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
      }
    });
  }

  void _showFilterPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                  builder: (BuildContext context, BoxConstraints constraints) {
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
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownButtonFormField<String>(
                                    value: _selectedType,
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
                                        _selectedType = newValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 16.0),
                                  DropdownButtonFormField<String>(
                                    value: _selectedSort,
                                    decoration: InputDecoration(
                                      labelText: 'Sort by',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    items: [
                                      'Price (High to Low)',
                                      'Price (Low to High)',
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
                                        _selectedSort = newValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 16.0),
                                  DropdownButtonFormField<String>(
                                    value: _selectedSaleRent,
                                    decoration: InputDecoration(
                                      labelText: 'Sale/Rent',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    items: ['All', 'For Sale', 'For Rent']
                                        .map((String option) {
                                      return DropdownMenuItem<String>(
                                        value: option,
                                        child: Text(option),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedSaleRent = newValue!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              Text('Price Range'),
                              RangeSlider(
                                values: _priceRange,
                                min: 3000,
                                max: 100000000,
                                divisions: null,
                                labels: RangeLabels(
                                  '${_priceRange.start.round()}',
                                  '${_priceRange.end.round()}',
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
                                      minValue = (minValue ~/ step) * step;
                                    } else {
                                      double step =
                                          20000; // Big step after reaching common point
                                      minValue = (minValue ~/ step) * step;
                                    }
                                    // for max value
                                    if (maxValue > commonPoint) {
                                      double step =
                                          20000; // Big step after reaching common point
                                      maxValue = (maxValue ~/ step) * step;
                                    } else {
                                      double step =
                                          1000; // Small to reach common point
                                      maxValue = (maxValue ~/ step) * step;
                                    }
                                    // Prevent overlapping at common point
                                    if (minValue >= commonPoint &&
                                        maxValue <= commonPoint) {
                                      minValue = commonPoint;
                                      maxValue = commonPoint;
                                    }
                                    _priceRange =
                                        RangeValues(minValue, maxValue);
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
                                            _bedrooms++;
                                          });
                                        },
                                      ),
                                      Text('$_bedrooms'),
                                      IconButton(
                                        icon: Icon(Icons.remove_circle,
                                            color: Color.fromARGB(
                                                255, 91, 53, 175)),
                                        onPressed: () {
                                          setState(() {
                                            if (_bedrooms > 0) _bedrooms--;
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
                                            _bathrooms++;
                                          });
                                        },
                                      ),
                                      Text('$_bathrooms'),
                                      IconButton(
                                        icon: Icon(Icons.remove_circle,
                                            color: Color.fromARGB(
                                                255, 91, 53, 175)),
                                        onPressed: () {
                                          setState(() {
                                            if (_bathrooms > 0) _bathrooms--;
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
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedType = 'All';
                                        _selectedSort = 'Price (Low to High)';
                                        _selectedSaleRent = 'All';
                                        _priceRange =
                                            RangeValues(3000, 100000000);
                                        _bedrooms = 0;
                                        _bathrooms = 0;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.white,
                                      side: BorderSide(color: Colors.black),
                                    ),
                                    child: Text('Clear'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _filterProperties();
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.white,
                                      side: BorderSide(color: Colors.black),
                                    ),
                                    child: Text('Apply Filter'),
                                  )
                                ],
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
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _filteredProperties = properties;
    _searchController.addListener(_filterProperties);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterProperties);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    TextStyle commonTextStyle = GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: const Color.fromARGB(255, 142, 140, 140),
    );

    TextStyle darkerTextStyle = GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    );

    BoxDecoration commonBoxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
      border: Border.all(
        color: Colors.grey,
        width: 1.0,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //go router thingy
          },
        ),
        title: Text(
          'Search Properties',
          style: darkerTextStyle,
        ),
        backgroundColor: Colors.white,
        elevation: 4,
        iconTheme: IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: commonBoxDecoration,
                    child: TextField(
                      style: commonTextStyle,
                      decoration: InputDecoration(
                        hintText: 'Search by location or address',
                        hintStyle: commonTextStyle,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Icon(Icons.search, size: 24),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: IconButton(
                            icon: const Icon(Icons.map_outlined,
                                color: Color.fromARGB(255, 92, 89, 89)),
                            onPressed: () {
                              // Implement map search functionality
                            },
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 40,
                  decoration: commonBoxDecoration,
                  child: ElevatedButton.icon(
                    onPressed: _showFilterPopup,
                    icon: Icon(Icons.filter_list),
                    label: Text(
                      'Filter',
                      style: commonTextStyle,
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      minimumSize: Size(screenWidth * 0.2, 20),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: _filteredProperties.isNotEmpty
                  ? ListView.builder(
                      itemCount: _filteredProperties.length,
                      itemBuilder: (context, index) {
                        return PropertyCard(
                          property: _filteredProperties[index],
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No properties found.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Save search functionality
                },
                child: Text('Save search'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 91, 53, 175),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  minimumSize: Size(screenWidth * 0.3, 40),
                  elevation: 5,
                  shadowColor: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
