// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:real_estate_marketplace/bloc/BottomNavigationBloc.dart';
import 'package:real_estate_marketplace/bloc/auth_bloc/auth_bloc.dart';
import 'package:real_estate_marketplace/bloc/home_bloc.dart';
import 'package:real_estate_marketplace/bloc/property/property_bloc.dart';
import 'package:real_estate_marketplace/bloc/property/property_event.dart';
import 'package:real_estate_marketplace/bloc/user_bloc/user_bloc.dart';
import 'package:real_estate_marketplace/models/auth_response_model.dart';
import 'package:real_estate_marketplace/models/property/property_model.dart';
import 'package:real_estate_marketplace/pages/side_bar_menu.dart';
import 'package:real_estate_marketplace/services/property/get_property_service.dart';
import 'package:real_estate_marketplace/utility/show_snackbar.dart';
import 'package:real_estate_marketplace/widgets/empty_property_card.dart';
import '../../widgets/bottom_navigation.dart';
import '../../models/properties_list_model.dart';
import '../../widgets/property_card.dart';
import '../../models/featured_property_model.dart';
import '../../widgets/featured_property_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Map<String, bool> selectedFilters = {
    'Commercial': false,
    'Apartment': false,
    'Villa': false,
    'Land': false,
    'Condo': false,
  };

  List<Property> filteredProperties = properties;
  List<FeaturedProperty> filteredFeaturedProperties = featuredPropertyList;

  GetPropertyService getPropertyService = GetPropertyService();

  getProperties() async {
    final response = await getPropertyService.getAllProperties();
    response.fold(
        (l) => {context.read<PropertyBloc>().add(FetchedPropertyListEvent(l!))},
        (r) => {
              showSnackBar(
                context,
                r,
                Colors.red,
              )
            });
  }

  @override
  void initState() {
    super.initState();
    getProperties();
    applyFilters();
  }

  void applyFilters() {
    setState(() {
      // Filter regular properties
      filteredProperties = properties.where((property) {
        if (selectedFilters.values.every((isSelected) => !isSelected)) {
          return true;
        }
        return selectedFilters.entries.any((filter) =>
            filter.value &&
            property.type.toLowerCase() == filter.key.toLowerCase());
      }).toList();

      // Filter featured properties
      filteredFeaturedProperties = featuredPropertyList.where((property) {
        if (selectedFilters.values.every((isSelected) => !isSelected)) {
          return true;
        }
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
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: BlocBuilder<UserBloc, AuthResponse>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Implement navigation to profile page
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: state.user.avatar != null
                              ? NetworkImage(state.user.avatar)
                              : AssetImage('assets/images/profile_icon.png'),
                          radius: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          state.user.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              );
            },
          ),
          centerTitle: false,
        ),
        drawer: const CustomDrawer(),
        drawerScrimColor:
            Colors.transparent, // Make outside of drawer clickable
        drawerEdgeDragWidth: MediaQuery.of(context).size.width * 0.5,
        body: GestureDetector(
          onTap: () {
            if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
              Navigator.of(context).pop(); // Close the drawer if open
            }
          },
          child: SingleChildScrollView(
            child: BlocBuilder<PropertyBloc, List<PropertyModel>>(
              builder: (context, state) {
                final featuredProperties = state
                    .where((property) => property.isFeatured == true)
                    .toList();
                final forSaleProperties = state
                    .where((property) => property.status == "for_sale")
                    .toList();
                final forRentProperties = state
                    .where((property) => property.status == "for_rent")
                    .toList();
                final forInvestmentProperties = state
                    .where((property) => property.status == "for_investment")
                    .toList();

                return Column(
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
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black87,
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(Icons.search, color: Colors.grey),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context.go('/search');
                                },
                                child: const Text(
                                  'Search by location or address',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child:
                                  Icon(Icons.map_outlined, color: Colors.grey),
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 164,
                      child: featuredProperties.isEmpty
                          ? const EmptyPropertyCard(
                              title: 'No featured properties')
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: featuredPropertyList.length > 5
                                  ? 6 // 5 properties + 1 for the "See All" button
                                  : featuredPropertyList.length +
                                      1, // Show "See All" even if fewer than 5
                              itemBuilder: (context, index) {
                                // Check if this is the last item, which will be the "See All" button
                                if (index == state.length || index == 5) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Implement navigation to the page with all featured properties
                                      context.go('/featuredProperties');
                                    },
                                    child: Container(
                                      width:
                                          70, // Adjust to make the button circular
                                      height: 70,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                        shape: BoxShape
                                            .circle, // Makes the container fully circular
                                      ),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.blueAccent,
                                          ),
                                          SizedBox(
                                              height:
                                                  4), // Add some spacing between the icon and text
                                          Text(
                                            'See All',
                                            style: TextStyle(
                                              fontSize:
                                                  10, // Smaller font size for text under icon
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }

                                // Display the featured property cards
                                return Container(
                                  width: 193,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: FeaturedPropertyCard(
                                    property: featuredProperties[index],
                                    showStatusTag:
                                        true, // Ensure status tag is shown
                                  ),
                                );
                              },
                            ),
                    ),

                    // For Rent Section
                    // For Rent Section
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'For Rent',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 165,
                      child: forRentProperties.isEmpty
                          ? const EmptyPropertyCard(
                              title: 'No properties for Rent')
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: forRentProperties.length > 5
                                  ? 6 // 5 properties + 1 for the "See All" button
                                  : forRentProperties.length +
                                      1, // Show "See All" even if fewer than 5
                              itemBuilder: (context, index) {
                                // Check if this is the last item, which will be the "See All" button
                                if (index == forRentProperties.length ||
                                    index == 5) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Implement navigation to the page with all "For Rent" properties
                                      context.go('/rentProperties');
                                    },
                                    child: Container(
                                      width:
                                          70, // Adjust to make the button circular
                                      height: 70,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                        shape: BoxShape
                                            .circle, // Makes the container fully circular
                                      ),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.blueAccent,
                                          ),
                                          SizedBox(
                                              height:
                                                  4), // Spacing between the icon and text
                                          Text(
                                            'See All',
                                            style: TextStyle(
                                              fontSize:
                                                  10, // Smaller font size for text under icon
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }

                                // Display the For Rent property cards
                                return Container(
                                  width: 150,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: PropertyCard(
                                    property: forRentProperties[index],
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 165,
                      child: forSaleProperties.isEmpty
                          ? const EmptyPropertyCard(
                              title: 'No properties for Sale')
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: forSaleProperties.length > 5
                                  ? 6 // 5 properties + 1 for the "See All" button
                                  : forSaleProperties.length +
                                      1, // Show "See All" even if fewer than 5
                              itemBuilder: (context, index) {
                                // Check if this is the last item, which will be the "See All" button
                                if (index == forSaleProperties.length ||
                                    index == 5) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Implement navigation to the page with all "For Sale" properties
                                      context.go('/saleProperties');
                                    },
                                    child: Container(
                                      width:
                                          70, // Adjust to make the button circular
                                      height: 70,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                        shape: BoxShape
                                            .circle, // Makes the container fully circular
                                      ),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.blueAccent,
                                          ),
                                          SizedBox(
                                              height:
                                                  4), // Spacing between the icon and text
                                          Text(
                                            'See All',
                                            style: TextStyle(
                                              fontSize:
                                                  10, // Smaller font size for text under icon
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }

                                // Display the For Sale property cards
                                return Container(
                                  width: 150,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: PropertyCard(
                                    property: forSaleProperties[index],
                                    showStatusTag:
                                        false, // Hide status tag in For Sale section
                                  ),
                                );
                              },
                            ),
                    ),

                    // For Investment Section
                    // For Investment Section
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'For Investment',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 165,
                      child: forInvestmentProperties.isEmpty
                          ? const EmptyPropertyCard(
                              title: 'No properties for Investment')
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: forInvestmentProperties.length > 5
                                  ? 6 // 5 properties + 1 for the "See All" button
                                  : forInvestmentProperties.length +
                                      1, // Show "See All" even if fewer than 5
                              itemBuilder: (context, index) {
                                // Check if this is the last item, which will be the "See All" button
                                if (index == forInvestmentProperties.length ||
                                    index == 5) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Implement navigation to the page with all "For Investment" properties
                                      context.go('/investmentProperties');
                                    },
                                    child: Container(
                                      width:
                                          70, // Adjust to make the button circular
                                      height: 70,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                        shape: BoxShape
                                            .circle, // Makes the container fully circular
                                      ),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.blueAccent,
                                          ),
                                          SizedBox(
                                              height:
                                                  4), // Spacing between the icon and text
                                          Text(
                                            'See All',
                                            style: TextStyle(
                                              fontSize:
                                                  10, // Smaller font size for text under icon
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }

                                // Display the For Investment property cards
                                return Container(
                                  width: 150,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: PropertyCard(
                                    property: forInvestmentProperties[index],
                                    showStatusTag:
                                        false, // Hide status tag in For Investment section
                                  ),
                                );
                              },
                            ),
                    ),

                    // add property section
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
                                        color: Colors.black),
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
                );
              },
            ),
          ),
        ),
        //bottom navigation bar
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
                switch (index) {
                  case 0:
                    context.go('/home');
                    break;
                  case 1:
                    context.go('/favorite');
                    break;
                  case 2:
                    context.go('/chat');
                    break;
                  case 3:
                    context.go('/notifications');
                    break;
                  case 4:
                    context.go('/profile');
                    break;
                }
              },
            );
          },
        ),
      ),
    );
  }

  // Filter chip builder
  Widget _buildFilterChip(IconData icon, String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: FilterChip(
        avatar: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black54,
          size: 16,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
          ),
        ),
        selected: isSelected,
        selectedColor: const Color.fromARGB(255, 130, 63, 185),
        onSelected: (bool selected) {
          setState(() {
            selectedFilters[label] = selected;
          });
          applyFilters();
        },
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
        return Icons.home_work;
      default:
        return Icons.home;
    }
  }
}
