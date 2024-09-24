// featured_property_model.dart
class FeaturedProperty {
  final String name;
  final double price;
  final String locationName;
  final String status; // "Rent" or "Sale" or "Investor"
  bool isFavourite;
  final String image;
  final String type; // "villa", "land", "commercial", "condo", "apartment"
  final double bedroom;
  final double bathroom;
  final DateTime dateAdded;

  FeaturedProperty({
    required this.name,
    required this.price,
    required this.locationName,
    required this.status,
    this.isFavourite = false,
    required this.image,
    required this.type,
    required this.bedroom,
    required this.bathroom,
    required this.dateAdded,
  });
}

// A list of featured properties
List<FeaturedProperty> featuredPropertyList = [
  FeaturedProperty(
    name: 'Luxury Villa',
    price: 5000000.00,
    locationName: 'Addis Sefer',
    status: 'For Investment',
    image: 'assets/images/Luxury_villa.png',
    type: 'villa',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 8, 22),
  ),
  FeaturedProperty(
    name: 'AB Realestate',
    price: 30000.00,
    locationName: 'Semmit',
    status: 'For Sale',
    image: 'assets/images/commercial_space.png',
    type: 'commercial',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 8, 10),
  ),
  FeaturedProperty(
    name: 'AB Realestate',
    price: 30000.00,
    locationName: 'Semmit',
    status: 'For Sale',
    image: 'assets/images/commercial_space.png',
    type: 'villa',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 8, 10),
  ),
  FeaturedProperty(
    name: 'CD Apartments',
    price: 10000.00,
    locationName: 'Tulu dimtu',
    status: 'For Investment',
    image: 'assets/images/commercial_space.png',
    type: 'apartment',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 5, 22),
  ),
  FeaturedProperty(
    name: 'Luxury Villa',
    price: 5000000.00,
    locationName: 'Addis Sefer',
    status: 'For Investment',
    image: 'assets/images/Luxury_villa.png',
    type: 'villa',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 8, 22),
  ),
  FeaturedProperty(
    name: 'Luxury Villa',
    price: 5000000.00,
    locationName: 'Addis Sefer',
    status: 'For Investment',
    image: 'assets/images/Luxury_villa.png',
    type: 'villa',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 8, 22),
  ),
  FeaturedProperty(
    name: 'Luxury Villa',
    price: 5000000.00,
    locationName: 'Addis Sefer',
    status: 'For Investment',
    image: 'assets/images/Luxury_villa.png',
    type: 'villa',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 8, 22),
  ),
  // Add more featured properties here
];
