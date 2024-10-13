import 'package:flutter/material.dart';
import 'package:real_estate_marketplace/models/property/property_model.dart';

class FeaturedPropertyCard extends StatefulWidget {
  final PropertyModel property;
  final bool showStatusTag;

  const FeaturedPropertyCard({
    super.key,
    required this.property,
    this.showStatusTag = true,
  });

  @override
  // ignore: library_private_types_in_public_api
  _FeaturedPropertyCardState createState() => _FeaturedPropertyCardState();
}

class _FeaturedPropertyCardState extends State<FeaturedPropertyCard> {
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    // isFavourite =
    //     widget.property.isFavourite; // Initialize with the current state
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 66,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
                image: DecorationImage(
                  image: AssetImage(widget.property.propertyImages?[0] ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(3.0),
                child: widget.showStatusTag && widget.property.status!.isNotEmpty
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 231, 229, 229),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Text(
                          widget.property.status ?? "N/A",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Property name and favorite button in a single row
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.property.propertyCategory?.category ?? 'N/A',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
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
                        // setState(() {
                        //   isFavourite = !isFavourite;
                        //   widget.property.isFavourite = isFavourite;
                        // });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 12,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        widget.property.propertyAddress?.city?.name ?? "N/A",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.monetization_on,
                        size: 12, color: Color.fromARGB(255, 0, 0, 0)),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '${widget.property.pricePerSquare} ETB',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
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
