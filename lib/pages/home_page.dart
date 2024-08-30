// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/BottomNavigationBloc.dart';
import 'package:real_estate_marketplace/bloc/home_bloc.dart';
import '../widgets/bottom_navigation.dart';
import '../models/properties_list_model.dart';
import '../widgets/property_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, bool> selectedFilters = {
    'Commercial': false,
    'Apartment': false,
    'Villa': false,
    'Land': false,
    'Condo': false,
  };

  List<Property> filteredProperties = properties;

  @override
  void initState() {
    super.initState();
    applyFilters(); // Apply filters initially
  }

  void applyFilters() {
    setState(() {
      filteredProperties = properties.where((property) {
        if (selectedFilters.values.every((isSelected) => !isSelected)) {
          // If no filters are selected, show all properties
          return true;
        }
        // Filter properties based on selected filters
        return selectedFilters.entries.any((filter) =>
            filter.value &&
            property.type.toLowerCase() == filter.key.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Implement menu functionality here
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // Implement navigation to profile page
                },
                child: const Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profile_icon.png'),
                      radius: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Name',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Image.asset(
                  'assets/images/banner_image.png',
                  width: 429,
                  height: 147,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 404,
                  height: 39.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                      color: const Color.fromARGB(255, 39, 39, 39),
                      width: 2.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.grey),
                        onPressed: () {
                          // Implement standard search functionality
                        },
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search by location or address',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      IconButton(
                        icon:
                            const Icon(Icons.map_outlined, color: Colors.grey),
                        onPressed: () {
                          // Implement map search functionality
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 32,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: selectedFilters.keys.map((label) {
                      return _buildFilterChip(
                        _getIconForLabel(label),
                        label,
                        selectedFilters[label]!,
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Featured Properties Section
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Featured Properties',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 164,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredProperties.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 193,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: PropertyCard(
                        property: filteredProperties[index],
                        showStatusTag:
                            true, // Show status tag in Featured Properties
                      ),
                    );
                  },
                ),
              ),

              // For Rent Section
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'For Rent',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 165,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredProperties
                      .where((property) => property.status == 'For Rent')
                      .length,
                  itemBuilder: (context, index) {
                    final rentProperties = filteredProperties
                        .where((property) => property.status == 'For Rent')
                        .toList();
                    return Container(
                      width: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: PropertyCard(
                        property: rentProperties[index],
                        showStatusTag:
                            false, // Hide status tag in For Rent section
                      ),
                    );
                  },
                ),
              ),

              // For Sale Section
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'For Sale',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 165,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredProperties
                      .where((property) => property.status == 'For Sale')
                      .length,
                  itemBuilder: (context, index) {
                    final saleProperties = filteredProperties
                        .where((property) => property.status == 'For Sale')
                        .toList();
                    return Container(
                      width: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: PropertyCard(
                        property: saleProperties[index],
                        showStatusTag:
                            false, // Hide status tag in For Sale section
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(255, 91, 53, 175),
                      width: 1.0,
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Property Deserves the Spotlight",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Reach more buyers. Showcase your home. Free and easy.",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Implement add property functionality
                        },
                        icon: const Icon(Icons.add,
                            color: Color.fromARGB(255, 238, 235, 235)),
                        label: const Text(
                          "Add Property",
                          style: TextStyle(
                              color: Color.fromARGB(255, 226, 223, 223)),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 91, 53, 175),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
        bottomNavigationBar:
            BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
            int currentIndex = 0;
            if (state is BottomNavigationUpdated) {
              currentIndex = state.selectedIndex;
            }

            return BottomNavigation(
              currentIndex: currentIndex,
              onItemSelected: (index) {
                context.read<HomeBloc>().add(HomeIndexChanged(index));

                // Implement navigation logic here
                switch (index) {
                  case 0:
                    context.go('/home'); // Navigate to Home Page
                    break;
                  case 1:
                    context.go('/favorite'); // Navigate to Favorite Page
                    break;
                  case 2:
                    context.go('/chat'); // Navigate to Chat Page
                    break;
                  case 3:
                    context
                        .go('/notifications'); // Navigate to Notification Page
                    break;
                  case 4:
                    context.go('/profile'); // Navigate to Profile Page
                    break;
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilterChip(IconData icon, String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: FilterChip(
        avatar: Icon(icon, color: isSelected ? Colors.white : Colors.grey),
        label: Text(
          label,
          style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
        selected: isSelected,
        onSelected: (bool selected) {
          setState(() {
            selectedFilters[label] = selected;
            applyFilters(); // Reapply filters when chip is selected
          });
        },
        selectedColor: const Color.fromARGB(255, 111, 71, 197),
        backgroundColor: Colors.white,
        checkmarkColor: Colors.white,
      ),
    );
  }

  IconData _getIconForLabel(String label) {
    switch (label) {
      case 'Commercial':
        return Icons.business;
      case 'Apartment':
        return Icons.apartment;
      case 'Villa':
        return Icons.villa;
      case 'Land':
        return Icons.landscape;
      case 'Condo':
        return Icons.location_city;
      default:
        return Icons.home;
    }
  }
}
