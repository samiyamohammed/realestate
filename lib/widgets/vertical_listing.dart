import 'package:flutter/material.dart';
import 'package:real_estate_marketplace/models/properties_list_model.dart';

class PropertyCard extends StatefulWidget {
  final Property property;

  const PropertyCard({super.key, required this.property});

  @override
  // ignore: library_private_types_in_public_api
  _PropertyCardState createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    isFavourite =
        widget.property.isFavourite; // Initialize with the current state
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 153,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Base Container
              Container(
                width: 120,
                height: 115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300], // Placeholder color
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        widget.property.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 40,
                            ),
                          );
                        },
                      ),
                    ),
                    // For Rent / For Sale Tag
                    Positioned(
                      top: 1,
                      left: 65,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          widget.property
                              .status, // "For Rent" , "For Sale" or "Sold"
                          style: const TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.property.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 14, color: Colors.black),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            widget.property.locationName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.attach_money,
                            size: 14, color: Colors.black),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            '${widget.property.price} ETB',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
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
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () {
                            // Handle share action
                          },
                        ),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'See Details',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () {
                              // See detail functionality
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
