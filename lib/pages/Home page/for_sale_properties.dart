import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/models/properties_list_model.dart';

class ForSalePropertiesPage extends StatelessWidget {
  const ForSalePropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Filter properties where the status is 'For Sale'
    final forSaleProperties =
        properties.where((property) => property.status == 'For Sale').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("For Sale Properties"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Use GoRouter to navigate to the Home page
            context.go('/home');
          },
        ),
      ),
      body: ListView.builder(
        itemCount: forSaleProperties.length,
        itemBuilder: (context, index) {
          final property = forSaleProperties[index];
          return PropertyCard(property: property);
        },
      ),
    );
  }
}

class PropertyCard extends StatefulWidget {
  final Property property;

  const PropertyCard({super.key, required this.property});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    // Check if the property is already in the favorites list
    isFavorited = widget.property.isFavourite;
  }

  void toggleFavorite() {
    setState(() {
      widget.property.isFavourite = !widget.property.isFavourite;
      isFavorited = widget.property.isFavourite;
    });
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
        height: 232,
        width: 380,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 110,
                    width: 359,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: AssetImage(widget.property.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Favorites and Share buttons
                        const Spacer(),
                        Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            children: [
                              // Favorite Button
                              IconButton(
                                icon: Icon(
                                  isFavorited
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                ),
                                color: isFavorited ? Colors.red : Colors.white,
                                onPressed: toggleFavorite,
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
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                          // Add navigation logic here
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
