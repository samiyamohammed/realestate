import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import '../models/properties_list_model.dart';
import '../widgets/property_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // Navigate to the profile page
        },
        child: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_icon.png'),
              radius: 16,
            ),
            SizedBox(width: 8),
            Text(
              'Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                      icon: const Icon(Icons.map_outlined, color: Colors.grey),
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
                  children: [
                    _buildFilterChip(Icons.business, 'Commercial'),
                    _buildFilterChip(Icons.apartment, 'Apartment'),
                    _buildFilterChip(Icons.house, 'Villa'),
                    _buildFilterChip(Icons.landscape, 'Land'),
                    _buildFilterChip(Icons.business, 'Condo'),
                  ],
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
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 193,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: PropertyCard(
                      property: properties[index],
                      showStatusTag: true, // Show status tag in Featured Properties
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
                itemCount: properties.where((property) => property.status == 'For Rent').length,
                itemBuilder: (context, index) {
                  final rentProperties = properties.where((property) => property.status == 'For Rent').toList();
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: PropertyCard(
                      property: rentProperties[index],
                      showStatusTag: false, // Hide status tag in For Rent section
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
                itemCount: properties.where((property) => property.status == 'For Sale').length,
                itemBuilder: (context, index) {
                  final saleProperties = properties.where((property) => property.status == 'For Sale').toList();
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: PropertyCard(
                      property: saleProperties[index],
                      showStatusTag: false, // Hide status tag in For Sale section
                    ),
                  );
                },
              ),
            ),
            // add property feature
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
                                fontSize: 14, fontWeight: FontWeight.normal, color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
  onPressed: () {
    // Implement add property functionality
  },
  icon: const Icon(Icons.add, color: Color.fromARGB(255, 238, 235, 235)), // Set the icon color to true white
  label: const Text(
    "Add Property",
    style: TextStyle(color: Color.fromARGB(255, 226, 223, 223)), // Set the text color to true white
  ),
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 91, 53, 175),
    foregroundColor: Colors.white, // Ensures the icon and text color are white
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 30), // Add some space before the bottom navigation
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
            // Implement additional navigation actions if needed
          });
        },
      ),
    );
  }

  Widget _buildFilterChip(IconData icon, String label) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 120),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 114, 48, 255).withOpacity(0.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color.fromARGB(255, 0, 0, 0), size: 16),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}