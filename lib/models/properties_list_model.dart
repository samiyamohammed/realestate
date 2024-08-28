class Property {
  final String name;
  final double price;
  final String locationName;
  final String status; // "Rent" or "Sale"
  bool isFavourite;
  final String image;
  final String type; // "villa", "land", "commercial", "condo"
  final double bedroom;
  final double bathroom;
  final DateTime dateAdded;

  Property({
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

  Null get title => null;
}

List<Property> properties = [
  Property(
    name: 'Luxury Villa',
    price: 5000000.00,
    locationName: 'Addis Sefer',
    status: 'For Sale',
    image: 'assets/images/Luxury_villa.png',
    type: 'villa',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 8, 22),
  ),
  Property(
    name: 'Commercial Space',
    price: 15000.00,
    locationName: 'Jemo',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'commercial',
    bedroom: 0,
    bathroom: 2,
    dateAdded: DateTime(2024, 8, 8),
  ),
  Property(
    name: 'AB Realestate',
    price: 30000.00,
    locationName: 'Semmit',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'villa',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 8, 10),
  ),
  Property(
    name: 'Commercial Space',
    price: 26000.00,
    locationName: 'Megenagna',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'commercial',
    bedroom: 0,
    bathroom: 1,
    dateAdded: DateTime(2024, 8, 20),
  ),
  Property(
    name: 'Land',
    price: 300000.00,
    locationName: 'Koye',
    status: 'For Sale',
    image: 'assets/images/Luxury_villa.png',
    type: 'land',
    bedroom: 0,
    bathroom: 0,
    dateAdded: DateTime(2024, 7, 22),
  ),
  Property(
    name: 'CD Apartments',
    price: 10000.00,
    locationName: 'Tulu dimtu',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'apartment',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 5, 22),
  ),
  Property(
    name: 'Single condo',
    price: 9000.00,
    locationName: 'Mexico',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'condo',
    bedroom: 1,
    bathroom: 1,
    dateAdded: DateTime(2024, 4, 22),
  ),
  Property(
    name: 'EF Apartments',
    price: 300000.00,
    locationName: 'Qirqos',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'apartment',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 8, 26),
  ),
  Property(
    name: 'Commercial Space',
    price: 12000.00,
    locationName: 'Qality',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'commercial',
    bedroom: 0,
    bathroom: 0,
    dateAdded: DateTime(2024, 8, 12),
  ),
  Property(
    name: 'Commercial Space',
    price: 300000.00,
    locationName: 'Jemo',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'commercial',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 2, 22),
  ),
  Property(
    name: 'Commercial Space',
    price: 300000.00,
    locationName: 'Jemo',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'commercial',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 1, 22),
  ),
  Property(
    name: 'Commercial Space',
    price: 300000.00,
    locationName: 'Jemo',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'commercial',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 3, 22),
  ),
  Property(
    name: 'Commercial Space',
    price: 300000.00,
    locationName: 'Jemo',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'commercial',
    bedroom: 4,
    bathroom: 2,
    dateAdded: DateTime(2024, 7, 26),
  ),
];