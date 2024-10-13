class PropertyAddressModel {
  int? id;
  String? latitude;
  String? longitude;
  Country? country;
  State? state;
  City? city;
  SubCity? subcity;
  Woreda? woreda;

  PropertyAddressModel(
      {this.id,
      this.latitude,
      this.longitude,
      this.country,
      this.state,
      this.city,
      this.subcity,
      this.woreda});

  PropertyAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    country = Country.fromJson(json['country']);
    state =  State.fromJson(json['state']) ;
    city = City.fromJson(json['city']);
    subcity = SubCity.fromJson(json['subcity']);
    woreda = Woreda.fromJson(json['woreda']) ;
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


class City {
  String? name;

  City({this.name});

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}


class SubCity {
  String? name;

  SubCity({this.name});

  SubCity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
class Woreda {
  String? name;

  Woreda({this.name});

  Woreda.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
