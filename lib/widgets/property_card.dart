import 'package:flutter/material.dart';
import '../models/properties_list_model.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  final bool showStatusTag; // New parameter to control the visibility of the status tag

  const PropertyCard({
    super.key,
    required this.property,
    this.showStatusTag = true, // Default value is true
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
  height: 70,
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(15.0),
      topRight: Radius.circular(15.0),
    ),
    image: DecorationImage(
      image: AssetImage(property.image),
      fit: BoxFit.cover,
    ),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      if (showStatusTag)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                property.status,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      // This Spacer pushes the status tag to the top
      const Spacer(),
    ],
  ),
),

          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        property.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border_outlined, color: Colors.red, size: 20),
                      onPressed: () {
                        // Implement your favorite functionality here
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 12, color: Color.fromARGB(255, 0, 0, 0)),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        property.locationName,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.monetization_on, size: 12, color: Color.fromARGB(255, 0, 0, 0)),
                    const SizedBox(width: 4),
                    Text(
                      '${property.price.toStringAsFixed(2)} ETB',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
