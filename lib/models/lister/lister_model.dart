import 'package:real_estate_marketplace/models/lister/lister_user_model.dart';

class ListerModel {
  final int id;
  final ListerUserModel user;
  final String? agencyName;
  final bool isVerified;
  final String? bio;
  final String? solledOrRentedHouse;
  final String? status;
  final DateTime? createdAt;


  const ListerModel({
    required this.id,
    this.agencyName,
    required this.user,
    this.isVerified = false,
    this.bio,
    this.solledOrRentedHouse,
    this.status,
    this.createdAt,
  });


  factory ListerModel.fromJson(Map<String, dynamic> json) => ListerModel(
    id: json['id'],
    user: ListerUserModel.fromJson(json['user']),
    agencyName: json['agency_name'],
    isVerified: json['is_verified'] == '1',
    bio: json['bio'],
    solledOrRentedHouse: json['solled_or_rented_house'],
    status: json['status'],
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user.toJson(),
    'agency_name': agencyName,
    'is_verified': isVerified,
    'bio': bio,
    'solled_or_rented_house': solledOrRentedHouse,
    'status': status,
    'created_at': createdAt!.toIso8601String(),
  };

  ListerModel copyWith({
    int? id,
    ListerUserModel? user,
    String? agencyName,
    bool? isVerified,
    String? bio,
    String? solledOrRentedHouse,
    String? status,
    DateTime? createdAt,
  }) {
    return ListerModel(
      id: id ?? this.id,
      user: user ?? this.user,
      agencyName: agencyName ?? this.agencyName,
      isVerified: isVerified ?? this.isVerified,
      bio: bio ?? this.bio,
      solledOrRentedHouse: solledOrRentedHouse ?? this.solledOrRentedHouse,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'ListerModel(id: $id, user: $user, agencyName: $agencyName, isVerified: $isVerified, bio: $bio, solledOrRentedHouse: $solledOrRentedHouse, status: $status, createdAt: $createdAt)';
  }

  
}

