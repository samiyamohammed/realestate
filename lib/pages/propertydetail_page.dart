import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/models/property/property_model.dart';
// import 'package:real_estate_marketplace/models/propertydetail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:real_estate_marketplace/pages/Home%20page/for_sale_properties.dart';
import 'package:video_player/video_player.dart';

import '../models/properties_list_model.dart';

class PropertyDetailPage extends StatefulWidget {
  final PropertyModel property;

  const PropertyDetailPage({super.key, required this.property});

  @override
  // ignore: library_private_types_in_public_api
  _PropertyDetailPageState createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {
  bool isExpanded = false;
  bool isExpandedf = false;
  bool isExpandedInterior = false;
  final int maxLines = 2;
  late VideoPlayerController _videoController;
  bool isExpandednearby = false;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.property.videoLink!))
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              GoRouter.of(context).pop();
            } else {
              GoRouter.of(context).go('/home');
            }
          },
        ),
        title: const Text('Property Detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Share functionality
            },
          ),
          IconButton(
            icon: Icon(
              // widget.property.isFavorited!
              widget.property.isFeatured!
                  ? Icons.favorite
                  : Icons.favorite_border,
              // color: widget.property.isFavorited!
              color: widget.property.isFeatured!
                  ? Colors.red
                  : const Color.fromARGB(255, 255, 0, 0),
            ),
            onPressed: () {
              setState(() {
                // widget.property.isFavourite = !widget.property.isFavourite;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.report_gmailerrorred_sharp),
            onPressed: () {
              // report functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Expanded section for scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Property image carousel
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                    ),
                    items: widget.property.propertyImages!.map((image) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Property Title and Status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // widget.property.name,
                        "property name",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 236, 200, 241),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          widget.property.status!,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Property Price and Location
                  Text(
                    '${widget.property.sellingPrice.toString()} ETB',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    // widget.property.location!,
                    'location',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Property Features (Bedrooms, Bathrooms, Sqft)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.bed_outlined),
                          const SizedBox(width: 4),
                          Text(
                              'Bedrooms - ${widget.property.numberOfBedrooms}'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.bathtub_outlined),
                          const SizedBox(width: 4),
                          Text(
                              'Bathrooms - ${widget.property.numberOfBathrooms}'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.square_foot),
                          const SizedBox(width: 4),
                          Text('${widget.property.area} Sq ft'),
                          // Text('${widget.property.pricePerSquare} Sq ft'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Property Tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      // if (widget.property.hasDiscount)
                      // if (widget.property.hasDiscount)
                      _buildInfoChip(
                          'Discount: ${double.parse(widget.property.sellingPrice!) - double.parse(widget.property.computingPrice!)} ETB',
                          Icons.discount),
                      _buildInfoChip('${widget.property.area} sqft lot',
                          Icons.aspect_ratio),
                      _buildInfoChip(
                          '${widget.property.propertyCategory.category}',
                          Icons.business),
                      _buildInfoChip('${widget.property.pricePerSquare} / sqft',
                          Icons.attach_money),
                      _buildInfoChip(
                          'Built in ${widget.property.ageOfBuilding}',
                          Icons.construction),
                      _buildInfoChip('HOA', Icons.home_work),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Property Description
                  const Text(
                    'About House',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final textSpan = TextSpan(
                        text: widget.property.description,
                        style: const TextStyle(fontSize: 16),
                      );
                      final textPainter = TextPainter(
                        text: textSpan,
                        maxLines: maxLines,
                        textDirection: TextDirection.ltr,
                      );
                      textPainter.layout(maxWidth: constraints.maxWidth);

                      final isDescriptionTooLong =
                          textPainter.didExceedMaxLines;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: isExpanded ? double.infinity : 60.0,
                            ),
                            child: Text(
                              widget.property.description!,
                              style: const TextStyle(fontSize: 16),
                              maxLines: isExpanded ? null : maxLines,
                              overflow: isExpanded
                                  ? TextOverflow.visible
                                  : TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (isDescriptionTooLong)
                            TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              icon: Icon(
                                isExpanded
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: Colors.purple,
                              ),
                              label: Text(
                                isExpanded ? 'See less' : 'See more',
                                style: const TextStyle(color: Colors.purple),
                              ),
                            ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Features',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isExpandedInterior) ...[
                        Container(
                          width: double.infinity,
                          color: const Color.fromARGB(255, 236, 200, 241),
                          child: const Text(
                            'Interior',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text('Bedrooms and bathrooms',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text('• Bedrooms - 4',
                            style: TextStyle(fontSize: 15)),
                        const Text('• Bthrooms - 2',
                            style: TextStyle(fontSize: 15)),
                        const SizedBox(height: 8),
                        const Text('Appliances',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text('• Hardwood Flooring',
                            style: TextStyle(fontSize: 15)),
                        const Text('• Central Heating',
                            style: TextStyle(fontSize: 15)),
                        const Text('• Fireplace',
                            style: TextStyle(fontSize: 15)),
                        const Text('• Ceiling Fan',
                            style: TextStyle(fontSize: 15)),
                        const Text('• Granite Countertops',
                            style: TextStyle(fontSize: 15)),
                        const SizedBox(height: 8),
                        const Text('Rooms',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text(
                            '•  Living Room, Dining Room, Primary Bedroom, Bedroom 4, Bedroom 2, Kitchen, Foyer, Breakfast Room, Primary Bathroom, Full Bath, Half Bath',
                            style: TextStyle(fontSize: 15)),
                        const Text('Basement',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text('• 0', style: TextStyle(fontSize: 15)),
                        const Text('Heating',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text('• Forched Air, Natural gas, Electric',
                            style: TextStyle(fontSize: 15)),
                        const Text('Cooling',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text('•Electric', style: TextStyle(fontSize: 15)),
                        const Text('Features',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text(
                            '•Built-in Features, Ceiling Fan(s), Dining Area, Kitchen - Gourmet, Kitchen - Table Space, Eat-in Kitchen',
                            style: TextStyle(fontSize: 15)),
                        const Text('•Flooring: Carpet, Wood Floors',
                            style: TextStyle(fontSize: 15)),
                        const Text('•Windows: Double Hung',
                            style: TextStyle(fontSize: 15)),
                        const Text('•Has basement: No',
                            style: TextStyle(fontSize: 15)),
                        const Text('•Number of fireplaces: 1',
                            style: TextStyle(fontSize: 15)),
                        const Text('•Fireplace features: Gas/Propane',
                            style: TextStyle(fontSize: 15)),
                        const Text('Interior Area',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text('•Total interior livable area: 1,852 sqft',
                            style: TextStyle(fontSize: 15)),
                        const Text('•Finished area above ground: 1,852',
                            style: TextStyle(fontSize: 15)),
                        const Text('•Finished area below ground: 0',
                            style: TextStyle(fontSize: 15)),
                        Container(
                          width: double.infinity,
                          color: const Color.fromARGB(255, 236, 200, 241),
                          child: const Text(
                            'Property',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text('Parking',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text('•Total Spaces: 1',
                            style: TextStyle(fontSize: 15)),
                        const Text(
                            '•Parking features: Private, Secured, Electric Vehicle Charging Station',
                            style: TextStyle(fontSize: 15)),
                        const Text('Features',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text('• Stories: 1',
                            style: TextStyle(fontSize: 15)),
                        const Text('• Pool features: None',
                            style: TextStyle(fontSize: 15)),
                        Container(
                          width: double.infinity,
                          color: const Color.fromARGB(255, 236, 200, 241),
                          child: const Text(
                            'Construction',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text('Type and Style',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text('• Home Type: Villa',
                            style: TextStyle(fontSize: 15)),
                        const Text('• Architectural style: Federal',
                            style: TextStyle(fontSize: 15)),
                        const Text('Condition',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text('• Excellent',
                            style: TextStyle(fontSize: 15)),
                        const Text('• New construction: No',
                            style: TextStyle(fontSize: 15)),
                        const Text('• Year built in: 1900',
                            style: TextStyle(fontSize: 15)),
                        const Text('Virtual Tour',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text('• View Virtual Tour',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                      ],
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            isExpandedInterior = !isExpandedInterior;
                          });
                        },
                        icon: Icon(
                          isExpandedInterior
                              ? Icons.expand_less
                              : Icons.expand_more,
                          color: Colors.purple,
                        ),
                        label: Text(
                          isExpandedInterior ? 'See less' : 'See more',
                          style: const TextStyle(color: Colors.purple),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Video player outside of "See more" section
                  _videoController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(_videoController),
                        )
                      : const Center(child: CircularProgressIndicator()),

                  const SizedBox(height: 16),

                  // Add video controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          _videoController.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: () {
                          setState(() {
                            _videoController.value.isPlaying
                                ? _videoController.pause()
                                : _videoController.play();
                          });
                        },
                      ),
                    ],
                  ),
                  const Text(
                    'Nearby',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isExpandednearby) ...[
                        Container(
                          width: double.infinity,
                          color: const Color.fromARGB(255, 236, 200, 241),
                          child: const Text(
                            'Schools',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text('Abugida School',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text(
                            '• Abugida school is educational institution that offer comprehensive instruction from grades 1 through 12. This school focus on providing high-quality education that encompasses a broad range of subjects, including math, science, language arts, and social studies. Is known for their commitment to academic excellence, preparing students for higher education and successful careers.',
                            style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          height: 8,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Walking Distance
                            Row(
                              children: [
                                Icon(Icons.directions_walk, color: Colors.blue),
                                SizedBox(width: 4),
                                Text('1.8 km (30 min left)'),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            // Biking Distance
                            Row(
                              children: [
                                Icon(Icons.directions_bike,
                                    color: Colors.green),
                                SizedBox(width: 4),
                                Text('1.8 km (15 min left)'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: double.infinity,
                          color: const Color.fromARGB(255, 236, 200, 241),
                          child: const Text(
                            'Mosques and Mussalas',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text('Dewam Mosque',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text(
                            '• Dewam Mosque, located in jsut 500m from this property, is renowned for its unique architectural style that blends traditional Islamic design with local cultural elements. The mosque serves as a center for community worship and social activities, attracting both locals and visitors. Its serene ambiance and beautiful surroundings make it a peaceful place for reflection and prayer. The mosque often hosts educational programs and events, fostering a sense of community and spiritual growth among its attendees.',
                            style: TextStyle(fontSize: 15)),
                        const SizedBox(
                          height: 8,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Walking Distance
                            Row(
                              children: [
                                Icon(Icons.directions_walk, color: Colors.blue),
                                SizedBox(width: 4),
                                Text('500 m (9 min left)'),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            // Biking Distance
                            Row(
                              children: [
                                Icon(Icons.directions_bike,
                                    color: Colors.green),
                                SizedBox(width: 4),
                                Text('500 m (5 min left)'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: double.infinity,
                          color: const Color.fromARGB(255, 236, 200, 241),
                          child: const Text(
                            'Churchs',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text('Lideta Mariam Betkristian',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text(
                            '• Lideta Mariam Betkristian is an Ethiopian Orthodox Tewahedo Church, serving as a place of worship and spiritual guidance for followers of the Orthodox Tewahedo faith. This church is deeply rooted in the rich traditions and beliefs of the Ethiopian Orthodox Tewahedo Church, one of the oldest Christian denominations in the world. It plays a significant role in the religious life of its community, offering regular liturgical services, sacraments, and religious education.',
                            style: TextStyle(fontSize: 15)),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Walking Distance
                            Row(
                              children: [
                                Icon(Icons.directions_walk, color: Colors.blue),
                                SizedBox(width: 4),
                                Text('1.6 km (20 min left)'),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            // Biking Distance
                            Row(
                              children: [
                                Icon(Icons.directions_bike,
                                    color: Colors.green),
                                SizedBox(width: 4),
                                Text('1.6 km (10 min left)'),
                              ],
                            ),
                          ],
                        ),
                      ],
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            isExpandednearby = !isExpandednearby;
                          });
                        },
                        icon: Icon(
                          isExpandednearby
                              ? Icons.expand_less
                              : Icons.expand_more,
                          color: Colors.purple,
                        ),
                        label: Text(
                          isExpandednearby ? 'See less' : 'See more',
                          style: const TextStyle(color: Colors.purple),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Agent Image and Name
                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/profile_icon.png'),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Name of the property owner/poster',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(Icons.check_circle, color: Colors.green),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Agent Description
                        const Text(
                          'Description of the agent or the personnel who posted the property',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        // Contact Info
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('+251###-###-###'),
                                Text('posteremail@sth.com'),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          // Center the row if needed
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 35), // Add horizontal spacing
                                  child: IconButton(
                                    icon: const Icon(Icons.call),
                                    color: Colors.green,
                                    onPressed: () {
                                      // Call functionality
                                    },
                                  ),
                                ),
                                const Text('Call'),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 35),
                                  child: IconButton(
                                    icon: const Icon(Icons.email),
                                    color: Colors.blue,
                                    onPressed: () {
                                      // Email functionality
                                    },
                                  ),
                                ),
                                const Text('Email'),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: IconButton(
                                    icon: const Icon(Icons.message),
                                    color: Colors.orange,
                                    onPressed: () {
                                      // Message functionality
                                    },
                                  ),
                                ),
                                const Text('Message'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Similar Properties',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var similarProperty in properties)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: PropertyCard(property: similarProperty),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          //action buttons
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    side: const BorderSide(color: Colors.purple, width: 2),
                  ),
                  onPressed: () {
                    context.go('/agent');
                  },
                  child: const Text(
                    'Contact',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );

                    if (selectedDate != null) {
                      TimeOfDay? selectedTime = await showTimePicker(
                        // ignore: use_build_context_synchronously
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (selectedTime != null) {
                        DateTime selectedDateTime = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );

                        showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Tour Scheduled'),
                              content: Text(
                                  'Your tour is scheduled for:\n${selectedDateTime.toString()}'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors
                                            .red), // Change to your desired color
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                        color: Colors
                                            .green), // Change to your desired color
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Request a Tour',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String label, IconData icon) {
    return Chip(
      label: Text(label),
      avatar: Icon(
        icon,
        size: 20,
        color: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(255, 236, 200, 241),
    );
  }
}
// List<Property> _getSimilarProperties() {
//   return properties
//       .where((property) =>
//           property.type == widget.property.type) 
//       .toList()
//       .sublist(0, 5); 
// }
