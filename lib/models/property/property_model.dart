import 'package:real_estate_marketplace/models/lister/lister_model.dart';
import 'package:real_estate_marketplace/models/property/property_address_model.dart';
import 'package:real_estate_marketplace/models/property/property_category_with_subcategory_model.dart';

class PropertyModel {
  int? id;
  ListerModel? listor; // Keeping 'listor' to match API
  PropertyAddressModel? propertyAddress;
  PropertyCategoryWithSubcategoryModel? propertyCategory;
  String? description;
  List<String>? amenities;
  String? quantities;
  String? floor;
  String? totalSellingArea;
  String? totalArea;
  String? status;
  bool? isFeatured;
  List<String>? neighborhood;
  List<String>? rooms;
  List<String>? features;
  String? numberOfBedrooms;
  String? numberOfBathrooms;
  String? kitchens;
  String? ageOfBuilding;
  String? numberOfBalconies;
  String? furnishingState;
  String? kitchenAppliances;
  String? laundryFacilities;
  List<String>? heatingType;
  List<String>? coolingType;
  List<String>? waterSupply;
  List<String>? electricitySupply;
  String? securitySystem;
  String? securitySystemDetail;
  String? electricityAccess;
  String? parkingSize;
  String? pricePerSquare;
  String? sellingPrice;
  String? computingPrice;
  String? monthlyRentPrice;
  String? googleLink;
  String? videoLink;
  String? virtualTourLink;
  List<String>? parking;
  List<String>? propertyImages;
  String? propertyLicense;
  String? isVerified;
  String? createdAt;
  String? updatedAt;

  PropertyModel({
    this.id,
    this.listor,
    this.propertyAddress,
    this.propertyCategory,
    this.description,
    this.amenities,
    this.quantities,
    this.floor,
    this.totalSellingArea,
    this.totalArea,
    this.status,
    this.isFeatured,
    this.neighborhood,
    this.rooms,
    this.features,
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
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'] as int?,
      listor: json['listor'] != null
          ? ListerModel.fromJson(json['listor'] as Map<String, dynamic>)
          : null,
      propertyAddress: json['property_address'] != null
          ? PropertyAddressModel.fromJson(
              json['property_address'] as Map<String, dynamic>)
          : null,
      propertyCategory: json['property_Category'] != null
          ? PropertyCategoryWithSubcategoryModel.fromJson(
              json['property_Category'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      amenities: json['amenities'] != null
          ? List<String>.from(json['amenities'])
          : null,
      quantities: json['quantities'] as String?,
      floor: json['floor'] as String?,
      totalSellingArea: json['total_selling_area'] as String?,
      totalArea: json['total_area'] as String?,
      status: json['status'] as String?,
      isFeatured: json['is_featured'] == '1', // Assuming '1' as true
      neighborhood: json['neighborhood'] != null
          ? List<String>.from(json['neighborhood'])
          : null,
      rooms: json['rooms'] != null ? List<String>.from(json['rooms']) : null,
      features:
          json['features'] != null ? List<String>.from(json['features']) : null,
      numberOfBedrooms: json['number_of_bedrooms'] as String?,
      numberOfBathrooms: json['number_of_bathrooms'] as String?,
      kitchens: json['kitchens'] as String?,
      ageOfBuilding: json['age_of_building'] as String?,
      numberOfBalconies: json['number_of_balconies'] as String?,
      furnishingState: json['furnishing_state'] as String?,
      kitchenAppliances: json['kitchen_appliances'] as String?,
      laundryFacilities: json['laundry_facilities'] as String?,
      heatingType: json['heating_type'] != null
          ? List<String>.from(json['heating_type'])
          : null,
      coolingType: json['cooling_type'] != null
          ? List<String>.from(json['cooling_type'])
          : null,
      waterSupply: json['water_supply'] != null
          ? List<String>.from(json['water_supply'])
          : null,
      electricitySupply: json['electricity_supply'] != null
          ? List<String>.from(json['electricity_supply'])
          : null,
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
      parking:
          json['parking'] != null ? List<String>.from(json['parking']) : null,
      propertyImages: json['property_images'] != null
          ? List<String>.from(json['property_images'])
          : null,
      propertyLicense: json['property_license'] as String?,
      isVerified: json['is_verified'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    if (listor != null) {
      data['listor'] = listor!.toJson();
    }
    if (propertyAddress != null) {
      data['property_address'] = propertyAddress!.toJson();
    }
    if (propertyCategory != null) {
      data['property_Category'] = propertyCategory!.toJson();
    }
    data['description'] = description;
    data['amenities'] = amenities;
    data['quantities'] = quantities;
    data['floor'] = floor;
    data['total_selling_area'] = totalSellingArea;
    data['total_area'] = totalArea;
    data['status'] = status;
    data['is_featured'] =
        isFeatured == true ? '1' : '0'; // Converting bool to string
    data['neighborhood'] = neighborhood;
    data['rooms'] = rooms;
    data['features'] = features;
    data['number_of_bedrooms'] = numberOfBedrooms;
    data['number_of_bathrooms'] = numberOfBathrooms;
    data['kitchens'] = kitchens;
    data['age_of_building'] = ageOfBuilding;
    data['number_of_balconies'] = numberOfBalconies;
    data['furnishing_state'] = furnishingState;
    data['kitchen_appliances'] = kitchenAppliances;
    data['laundry_facilities'] = laundryFacilities;
    data['heating_type'] = heatingType;
    data['cooling_type'] = coolingType;
    data['water_supply'] = waterSupply;
    data['electricity_supply'] = electricitySupply;
    data['security_system'] = securitySystem;
    data['security_system_detail'] = securitySystemDetail;
    data['electricity_access'] = electricityAccess;
    data['parking_size'] = parkingSize;
    data['price_per_square'] = pricePerSquare;
    data['selling_price'] = sellingPrice;
    data['computing_price'] = computingPrice;
    data['monthly_rent_price'] = monthlyRentPrice;
    data['google_link'] = googleLink;
    data['video_link'] = videoLink;
    data['virtual_tour_link'] = virtualTourLink;
    data['parking'] = parking;
    data['property_images'] = propertyImages;
    data['property_license'] = propertyLicense;
    data['is_verified'] = isVerified;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
