class Property {
  final String name;
  final double price;
  final String locationName;
  final String status; // "Rent" or "Sale"
  bool isFavourite;
  final String image;
  final String type; // "villa", "land", "commercial", "condo"

  Property({
    required this.name,
    required this.price,
    required this.locationName,
    required this.status,
    this.isFavourite = false,
    required this.image,
    required this.type,
  });
}

List<Property> properties = [
  Property(
    name: 'Luxury Villa',
    price: 500000.00,
    locationName: 'Addis Sefer',
    status: 'For Sale',
    image: 'assets/images/Luxury_villa.png',
    type: 'villa',
  ),
  Property(
    name: 'Commercial Space',
    price: 300000.00,
    locationName: 'Jemo',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'commercial',
  ),
  Property(
    name: 'AB Realestate',
    price: 30000.00,
    locationName: 'Semmit',
    status: 'For Rent',
    image: 'assets/images/Luxury_villa.png',
    type: 'apartment',
  ),
   Property(
    name: 'Commercial Space',
    price: 260000.00,
    locationName: 'Megenagna',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'commercial',
  ),
    Property(
    name: 'Land',
    price: 300000.00,
    locationName: 'Koye',
    status: 'For Sale',
    image: 'assets/images/Luxury_villa.png',
    type: 'villa',
  ),
     Property(
    name: 'VD Apartments',
    price: 260000.00,
    locationName: 'Ayat',
    status: 'For Rent',
    image: 'assets/images/commercial_space.png',
    type: 'apartment',
  ),

];