import 'package:real_estate_marketplace/models/lister/lister_model.dart';
import 'package:real_estate_marketplace/models/property/propertu_category_model.dart';
import 'package:real_estate_marketplace/models/property/property_address_model.dart';

class PropertyModel {
  final int id;
  final ListerModel lister;
  final PropertyCategoryModel propertyCategory;
  final PropertyAddressModel propertyAddress;
  final String? title;
  final String? description;
  final List<String>? amenities;
  final String? quantities;
  final String? floor;
  final String? area;
  final String? status;
  final bool? isFeatured;
  final List<String>? neighborhood;
  final String? livingRooms;
  final String? numberOfBedrooms;
  final String? numberOfBathrooms;
  final String? kitchens;
  final String? ageOfBuilding;
  final String? numberOfBalconies;
  final String? furnishingState;
  final String? kitchenAppliances;
  final String? laundryFacilities;
  final List<String>? heatingType;
  final List<String>? coolingType;
  final List<String>? waterSupply;
  final List<String>? electricitySupply;
  final String? securitySystem;
  final String? securitySystemDetail;
  final String? electricityAccess;
  final String? parkingSize;
  final String? pricePerSquare;
  final String? sellingPrice;
  final String? computingPrice;
  final String? monthlyRentPrice;
  final String? googleLink;
  final String? videoLink;
  final String? virtualTourLink;
  final List<String>? parking;
  final List<String>? propertyImages;
  final String? propertyLicense;
  final bool? isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PropertyModel({
    this.id = 0,
    this.title,
    this.description,
    this.amenities,
    this.quantities,
    this.floor,
    this.area,
    this.status,
    this.isFeatured,
    this.neighborhood,
    this.livingRooms,
    this.numberOfBedrooms,
    this.numberOfBathrooms,
    this.kitchens,
    this.ageOfBuilding,
    this.numberOfBalconies,
    this.furnishingState,
    this.kitchenAppliances,
    this.laundryFacilities,
    this.heatingType,
    this.coolingType,
    this.waterSupply,
    this.electricitySupply,
    this.securitySystem,
    this.securitySystemDetail,
    this.electricityAccess,
    this.parkingSize,
    this.pricePerSquare,
    this.sellingPrice,
    this.computingPrice,
    this.monthlyRentPrice,
    this.googleLink,
    this.videoLink,
    this.virtualTourLink,
    this.parking,
    this.propertyImages,
    this.propertyLicense,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    required this.lister,
    required this.propertyCategory,
    required this.propertyAddress,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        lister: ListerModel.fromJson(json['listor']),
        propertyCategory:
            PropertyCategoryModel.fromJson(json['property_Category']),
        propertyAddress:
            PropertyAddressModel.fromJson(json['property_address']),
        title: json['title'] as String?,
        description: json['description'] as String?,
        amenities: (json['amenities'] as List<dynamic>?)?.cast<String>(),
        quantities: json['quantities'] as String?,
        floor: json['floor'] as String?,
        area: json['area'] as String?,
        status: json['status'] as String?,
        isFeatured: json['is_featured'] == '1',
        neighborhood: (json['neighborhood'] as List<dynamic>?)?.cast<String>(),
        livingRooms: json['living_rooms'] as String?,
        numberOfBedrooms: json['number_of_bedrooms'] as String?,
        numberOfBathrooms: json['number_of_bathrooms'] as String?,
        kitchens: json['kitchens'] as String?,
        ageOfBuilding: json['age_of_building'] as String?,
        numberOfBalconies: json['number_of_balconies'] as String?,
        furnishingState: json['furnishing_state'] as String?,
        kitchenAppliances: json['kitchen_appliances'] as String?,
        laundryFacilities: json['laundry_facilities'] as String?,
        heatingType: (json['heating_type'] as List<dynamic>?)?.cast<String>(),
        coolingType: (json['cooling_type'] as List<dynamic>?)?.cast<String>(),
        waterSupply: (json['water_supply'] as List<dynamic>?)?.cast<String>(),
        electricitySupply:
            (json['electricity_supply'] as List<dynamic>?)?.cast<String>(),
        securitySystem: json['security_system'] as String?,
        securitySystemDetail: json['security_system_detail'] as String?,
        electricityAccess: json['electricity_access'] as String?,
        parkingSize: json['parking_size'] as String?,
        pricePerSquare: json['price_per_square'] as String?,
        sellingPrice: json['selling_price'] as String?,
        computingPrice: json['computing_price'] as String?,
        monthlyRentPrice: json['monthly_rent_price'] as String?,
        googleLink: json['google_link'] as String?,
        videoLink: json['video_link'] as String?,
        virtualTourLink: json['virtual_tour_link'] as String?,
        parking: (json['parking'] as List<dynamic>?)?.cast<String>(),
        propertyImages:
            (json['property_images'] as List<dynamic>?)?.cast<String>(),
        propertyLicense: json['property_license'] as String?,
        isVerified: json['is_verified'] == '1',
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'amenities': amenities,
        'quantities': quantities,
        'floor': floor,
        'area': area,
        'status': status,
        'is_featured': isFeatured,
        'neighborhood': neighborhood,
        'living_rooms': livingRooms,
        'number_of_bedrooms': numberOfBedrooms,
        'number_of_bathrooms': numberOfBathrooms,
        'kitchens': kitchens,
        'age_of_building': ageOfBuilding,
        'number_of_balconies': numberOfBalconies,
        'furnishing_state': furnishingState,
        'kitchen_appliances': kitchenAppliances,
        'laundry_facilities': laundryFacilities,
        'heating_type': heatingType,
        'cooling_type': coolingType,
        'water_supply': waterSupply,
        'electricity_supply': electricitySupply,
        'security_system': securitySystem,
        'security_system_detail': securitySystemDetail,
        'electricity_access': electricityAccess,
        'parking_size': parkingSize,
        'price_per_square': pricePerSquare,
        'selling_price': sellingPrice,
        'computing_price': computingPrice,
        'monthly_rent_price': monthlyRentPrice,
        'google_link': googleLink,
        'video_link': videoLink,
        'virtual_tour_link': virtualTourLink,
        'parking': parking,
        'property_images': propertyImages,
        'property_license': propertyLicense,
        'is_verified': isVerified,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
