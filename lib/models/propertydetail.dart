class PropertySample {
  final String name;
  final String status;
  final String type;
  final String location;
  bool isFavourite;
  final int numberOfBedrooms;
  final int numberOfBathrooms;
  final int numberOfLivingRooms;
  final int buildingGPlus;
  final int builtYear;
  final int numberOfBalconies;
  final double sellingPrice;
  final double computingPrice;
  final double pricePerSquareMeter;
  final bool isFurnished;
  final int numberOfKitchens;
  final String videoLink;
  final String virtualTourLink;
  final List<String> features;
  final List<String> appliances;
  final List<String> images;
  final String securitySystem;
  final bool hasSecurityAccess;
  final bool hasElevatorAccess;
  final String priceType;
  final String parking;
  final int parkingSize;
  final DateTime dateAdded;
  final bool hasLicenseDocument;
  String description;

  PropertySample({
    required this.name,
    required this.status,
    required this.type,
    required this.location,
    required this.isFavourite,
    required this.numberOfBedrooms,
    required this.numberOfBathrooms,
    required this.numberOfLivingRooms,
    required this.builtYear,
    required this.buildingGPlus,
    required this.numberOfBalconies,
    required this.sellingPrice,
    required this.computingPrice,
    required this.pricePerSquareMeter,
    required this.isFurnished,
    required this.numberOfKitchens,
    required this.features,
    required this.appliances,
    required this.images,
    required this.videoLink,
    required this.virtualTourLink,
    required this.hasSecurityAccess,
    required this.hasElevatorAccess,
    required this.priceType,
    required this.securitySystem,
    required this.parking,
    required this.parkingSize,
    required this.dateAdded,
    required this.hasLicenseDocument,
    required this.description,
  });

  bool get hasDiscount => computingPrice < sellingPrice;

  static List<PropertySample> sampleones = sampleproperties;
}

// Mock function to retrieve a PropertySample by name
PropertySample getPropertyByName(String name) {
  List<PropertySample> propertyList = sampleproperties;

  return propertyList.firstWhere((property) => property.name == name);
}

List<PropertySample> sampleproperties = [
  PropertySample(
    name: "Luxury Villa",
    status: "For Sale",
    type: "Residential",
    location: "Addis Sefer, Addis Ababa, Ethiopia",
    isFavourite: false,
    buildingGPlus: 2,
    numberOfLivingRooms: 2,
    numberOfBedrooms: 4,
    numberOfBathrooms: 2,
    numberOfKitchens: 1,
    numberOfBalconies: 1,
    builtYear: 2020,
    pricePerSquareMeter: 150,
    sellingPrice: 5000000.00,
    computingPrice: 54000000.00,
    priceType: "Sale Price",
    isFurnished: true,
    features: ["Furnished", "Security System", "Garden"],
    appliances: ["Stove", "Refrigerator", "Microwave"],
    hasSecurityAccess: true,
    securitySystem: "Security guards and advanced security cameras",
    hasElevatorAccess: false,
    parking: "Garage",
    parkingSize: 2,
    images: [
      "assets/images/Luxury_villa.png",
      "assets/images/Luxury_villa.png",
      "assets/images/Luxury_villa.png",
      "assets/images/Luxury_villa.png",
      "assets/images/Luxury_villa.png",
      "assets/images/Luxury_villa.png",
      "assets/images/Luxury_villa.png",
    ],
    virtualTourLink: "https://example.com/tour",
    videoLink: "https://youtu.be/5myfOaVzKw0?si=V5cksHjwCaBBPxO8",
    dateAdded: DateTime(2024, 8, 22),
    hasLicenseDocument: true,
    description:
        "Modern amenities and a great location.Perfect for city living. Sophisticated, urban living at its finest! This spectacular town home (one of only three on the block measuring 23-feet wide) is situated on one of North DuPont/Adams Morgan’s historic and most charming, tree-lined streets! IYKYK! With recent valuable upgrades and improvements (both aesthetically and structurally), this is the home you have been looking for.",
  ),
  PropertySample(
      name: "AB realestate",
      status: "For Rent",
      type: "Commercial",
      location: "Addis Ababa, Ethiopia",
      isFavourite: false,
      buildingGPlus: 12,
      numberOfLivingRooms: 0,
      numberOfBedrooms: 0,
      numberOfBathrooms: 0,
      numberOfKitchens: 0,
      numberOfBalconies: 2,
      builtYear: 2002,
      pricePerSquareMeter: 160,
      sellingPrice: 20000.00,
      computingPrice: 21000.00,
      priceType: "Sale Price",
      isFurnished: true,
      features: ["Furnished", "Security System", "Garden"],
      appliances: ["Stove", "Refrigerator", "Microwave"],
      hasSecurityAccess: false,
      securitySystem: " ",
      hasElevatorAccess: true,
      parking: "Garage",
      parkingSize: 2,
      images: [
        "assets/images/commercial_space.png",
        "assets/images/commercial_space.png"
      ],
      virtualTourLink: "https://example.com/tour",
      videoLink: "https://youtu.be/5myfOaVzKw0?si=V5cksHjwCaBBPxO8",
      dateAdded: DateTime(2024, 8, 8),
      hasLicenseDocument: false,
      description: "Spacious interiors with high ceilings"),
  PropertySample(
    name: "Luxury Villa",
    status: "For Sale",
    type: "Residential",
    location: "Addis Ababa, Ethiopia",
    isFavourite: false,
    buildingGPlus: 2,
    numberOfLivingRooms: 2,
    numberOfBedrooms: 5,
    numberOfBathrooms: 4,
    numberOfKitchens: 2,
    numberOfBalconies: 2,
    builtYear: 2017,
    pricePerSquareMeter: 170,
    sellingPrice: 500000.00,
    computingPrice: 450000.00,
    priceType: "Sale Price",
    isFurnished: true,
    features: ["Furnished", "Security System", "Garden"],
    appliances: ["Stove", "Refrigerator", "Microwave"],
    hasSecurityAccess: true,
    securitySystem: "Advanced Security Cameras",
    hasElevatorAccess: true,
    parking: "Garage",
    parkingSize: 2,
    images: [
      "https://example.com/image1.jpg",
      "https://example.com/image2.jpg"
    ],
    virtualTourLink: "https://example.com/tour",
    videoLink: "https://youtu.be/5myfOaVzKw0?si=V5cksHjwCaBBPxO8",
    dateAdded: DateTime(2024, 8, 10),
    hasLicenseDocument: true,
    description: "Perfect for city living",
  ),
];
