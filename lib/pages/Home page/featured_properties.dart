import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/models/featured_property_model.dart';

// Global favorite list (could be replaced by Bloc or provider)
List<FeaturedProperty> favoriteProperties = [];

class FeaturedPropertiesPage extends StatelessWidget {
  const FeaturedPropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Featured Properties"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Use GoRouter to navigate to the Home page
            context.go('/home');
          },
        ),
      ),
      body: ListView.builder(
        itemCount: featuredPropertyList.length,
        itemBuilder: (context, index) {
          final property = featuredPropertyList[index];
          return FeaturedPropertyCard(property: property);
        },
      ),
    );
  }
}

class FeaturedPropertyCard extends StatefulWidget {
  final FeaturedProperty property;

  const FeaturedPropertyCard({super.key, required this.property});

  @override
  State<FeaturedPropertyCard> createState() => _FeaturedPropertyCardState();
}

class _FeaturedPropertyCardState extends State<FeaturedPropertyCard> {
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    isFavourite =
        widget.property.isFavourite; // Initialize with the current state
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
      child: SizedBox(
        height: 232, // Decreased card height
        width: 380, // Decreased card width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 110, // Fixed image height
                    width: 359, // Fixed image width
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded borders
                      image: DecorationImage(
                        image: AssetImage(widget.property.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Property Status
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              widget.property.status,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // Favorites and Share buttons
                        Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            children: [
                              // Favorite Button
                              IconButton(
                                icon: Icon(
                                  isFavourite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavourite
                                      ? Colors.red
                                      : const Color.fromARGB(
                                          255, 255, 255, 255),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isFavourite = !isFavourite;
                                    widget.property.isFavourite = isFavourite;
                                  });
                                },
                              ),
                              // Share Button
                              IconButton(
                                icon: const Icon(Icons.share),
                                color: Colors.white,
                                onPressed: () {
                                  // Add share button logic here
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12.0), // Added horizontal padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Property Name
                  Text(
                    widget.property.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_pin,
                          color: Colors.black, size: 16),
                      const SizedBox(width: 4),
                      Text(widget.property.locationName),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Price
                  Row(
                    children: [
                      const Icon(Icons.monetization_on,
                          color: Colors.black, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "${widget.property.price.toStringAsFixed(0)} ETB",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Date added and See Details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Listed ${_timeAgo(widget.property.dateAdded)}",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Add navigation logic here, e.g., navigate to property details
                        },
                        child: const Text(
                          "See Details",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to calculate how long ago the property was added
  String _timeAgo(DateTime dateAdded) {
    final duration = DateTime.now().difference(dateAdded);
    if (duration.inDays > 0) {
      return "${duration.inDays} day(s) ago";
    } else if (duration.inHours > 0) {
      return "${duration.inHours} hour(s) ago";
    } else {
      return "${duration.inMinutes} minute(s) ago";
    }
  }
}
