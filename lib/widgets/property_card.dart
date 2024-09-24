import 'package:flutter/material.dart';
import '../models/properties_list_model.dart';

class PropertyCard extends StatefulWidget {
  final Property property;
  final bool showStatusTag;

  const PropertyCard({
    super.key,
    required this.property,
    this.showStatusTag = true,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PropertyCardState createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
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
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container with padding and rounded corners
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(widget.property.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 0),

          // Property details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Property name and favorite button in a single row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Align to center
                  children: [
                    Expanded(
                      child: Text(
                        widget.property.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isFavourite ? Icons.favorite : Icons.favorite_border,
                        color: isFavourite
                            ? Colors.red
                            : const Color.fromARGB(255, 255, 0, 0),
                      ),
                      onPressed: () {
                        setState(() {
                          isFavourite = !isFavourite;
                          widget.property.isFavourite = isFavourite;
                        });
                      },
                    ),
                  ],
                ),

                // Property location
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 12,
                        color: Color.fromARGB(255, 190, 190, 190),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.property.locationName,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),

                // Property price
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        size: 12,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.property.price.toStringAsFixed(2)} ETB',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
