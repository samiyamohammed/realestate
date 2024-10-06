class Property {
  Data? data;

  Property({this.data});

  Property.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Listor? listor;
  PropertyAddress? propertyAddress;
  PropertyCategory? propertyCategory;
  String? description;
  String? amenities;
  String? quantities;
  String? floor;
  String? area;
  String? status;
  String? isFeatured;
  String? neighborhood;
  String? livingRooms;
  String? numberOfBedrooms;
  String? numberOfBathrooms;
  String? kitchens;
  String? ageOfBuilding;
  String? numberOfBalconies;
  String? furnishingState;
  Null? kitchenAppliances;
  Null? laundryFacilities;
  String? heatingType;
  String? coolingType;
  String? waterSupply;
  String? electricitySupply;
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
  String? parking;
  String? propertyImages;
  String? propertyLicense;
  String? isVerified;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.listor,
      this.propertyAddress,
      this.propertyCategory,
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
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    listor =
        json['listor'] != null ? new Listor.fromJson(json['listor']) : null;
    propertyAddress = json['property_address'] != null
        ? new PropertyAddress.fromJson(json['property_address'])
        : null;
    propertyCategory = json['property_Category'] != null
        ? new PropertyCategory.fromJson(json['property_Category'])
        : null;
    description = json['description'];
    amenities = json['amenities'];
    quantities = json['quantities'];
    floor = json['floor'];
    area = json['area'];
    status = json['status'];
    isFeatured = json['is_featured'];
    neighborhood = json['neighborhood'];
    livingRooms = json['living_rooms'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfBathrooms = json['number_of_bathrooms'];
    kitchens = json['kitchens'];
    ageOfBuilding = json['age_of_building'];
    numberOfBalconies = json['number_of_balconies'];
    furnishingState = json['furnishing_state'];
    kitchenAppliances = json['kitchen_appliances'];
    laundryFacilities = json['laundry_facilities'];
    heatingType = json['heating_type'];
    coolingType = json['cooling_type'];
    waterSupply = json['water_supply'];
    electricitySupply = json['electricity_supply'];
    securitySystem = json['security_system'];
    securitySystemDetail = json['security_system_detail'];
    electricityAccess = json['electricity_access'];
    parkingSize = json['parking_size'];
    pricePerSquare = json['price_per_square'];
    sellingPrice = json['selling_price'];
    computingPrice = json['computing_price'];
    monthlyRentPrice = json['monthly_rent_price'];
    googleLink = json['google_link'];
    videoLink = json['video_link'];
    virtualTourLink = json['virtual_tour_link'];
    parking = json['parking'];
    propertyImages = json['property_images'];
    propertyLicense = json['property_license'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listor != null) {
      data['listor'] = this.listor!.toJson();
    }
    if (this.propertyAddress != null) {
      data['property_address'] = this.propertyAddress!.toJson();
    }
    if (this.propertyCategory != null) {
      data['property_Category'] = this.propertyCategory!.toJson();
    }
    data['description'] = this.description;
    data['amenities'] = this.amenities;
    data['quantities'] = this.quantities;
    data['floor'] = this.floor;
    data['area'] = this.area;
    data['status'] = this.status;
    data['is_featured'] = this.isFeatured;
    data['neighborhood'] = this.neighborhood;
    data['living_rooms'] = this.livingRooms;
    data['number_of_bedrooms'] = this.numberOfBedrooms;
    data['number_of_bathrooms'] = this.numberOfBathrooms;
    data['kitchens'] = this.kitchens;
    data['age_of_building'] = this.ageOfBuilding;
    data['number_of_balconies'] = this.numberOfBalconies;
    data['furnishing_state'] = this.furnishingState;
    data['kitchen_appliances'] = this.kitchenAppliances;
    data['laundry_facilities'] = this.laundryFacilities;
    data['heating_type'] = this.heatingType;
    data['cooling_type'] = this.coolingType;
    data['water_supply'] = this.waterSupply;
    data['electricity_supply'] = this.electricitySupply;
    data['security_system'] = this.securitySystem;
    data['security_system_detail'] = this.securitySystemDetail;
    data['electricity_access'] = this.electricityAccess;
    data['parking_size'] = this.parkingSize;
    data['price_per_square'] = this.pricePerSquare;
    data['selling_price'] = this.sellingPrice;
    data['computing_price'] = this.computingPrice;
    data['monthly_rent_price'] = this.monthlyRentPrice;
    data['google_link'] = this.googleLink;
    data['video_link'] = this.videoLink;
    data['virtual_tour_link'] = this.virtualTourLink;
    data['parking'] = this.parking;
    data['property_images'] = this.propertyImages;
    data['property_license'] = this.propertyLicense;
    data['is_verified'] = this.isVerified;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Listor {
  int? id;
  User? user;
  String? agencyName;
  String? isVerified;
  String? bio;
  String? solledOrRentedHouse;
  String? status;
  String? createdAt;
  String? updatedAt;

  Listor(
      {this.id,
      this.user,
      this.agencyName,
      this.isVerified,
      this.bio,
      this.solledOrRentedHouse,
      this.status,
      this.createdAt,
      this.updatedAt});

  Listor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    agencyName = json['agency_name'];
    isVerified = json['is_verified'];
    bio = json['bio'];
    solledOrRentedHouse = json['solled_or_rented_house'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['agency_name'] = this.agencyName;
    data['is_verified'] = this.isVerified;
    data['bio'] = this.bio;
    data['solled_or_rented_house'] = this.solledOrRentedHouse;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  String? name;
  String? email;
  Null? phone;
  String? role;

  User({this.name, this.email, this.phone, this.role});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['role'] = this.role;
    return data;
  }
}

class PropertyAddress {
  int? id;
  String? latitude;
  String? longitude;
  Country? country;
  State? state;
  State? city;
  State? subcity;
  State? woreda;

  PropertyAddress(
      {this.id,
      this.latitude,
      this.longitude,
      this.country,
      this.state,
      this.city,
      this.subcity,
      this.woreda});

  PropertyAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
    city = json['city'] != null ? new State.fromJson(json['city']) : null;
    subcity =
        json['subcity'] != null ? new State.fromJson(json['subcity']) : null;
    woreda = json['woreda'] != null ? new State.fromJson(json['woreda']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.subcity != null) {
      data['subcity'] = this.subcity!.toJson();
    }
    if (this.woreda != null) {
      data['woreda'] = this.woreda!.toJson();
    }
    return data;
  }
}

class Country {
  String? name;
  String? code;

  Country({this.name, this.code});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}

class State {
  String? name;

  State({this.name});

  State.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class PropertyCategorys {
  PropertyCategory? propertyCategory;
  int? id;
  String? propertySubcategoryName;
  String? propertySubcategoryDescription;

  PropertyCategorys(
      {this.propertyCategory,
      this.id,
      this.propertySubcategoryName,
      this.propertySubcategoryDescription});

  PropertyCategorys.fromJson(Map<String, dynamic> json) {
    propertyCategory = json['property_category'] != null
        ? new PropertyCategory.fromJson(json['property_category'])
        : null;
    id = json['id'];
    propertySubcategoryName = json['Property_subcategory_name'];
    propertySubcategoryDescription = json['Property_subcategory_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.propertyCategory != null) {
      data['property_category'] = this.propertyCategory!.toJson();
    }
    data['id'] = this.id;
    data['Property_subcategory_name'] = this.propertySubcategoryName;
    data['Property_subcategory_description'] =
        this.propertySubcategoryDescription;
    return data;
  }
}

class PropertyCategory {
  String? title;
  String? description;

  PropertyCategory({this.title, this.description});

  PropertyCategory.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
