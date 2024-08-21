class FavoriteModel {
  final String sellOrRent;
  final String houseName;
  final String location;
  final double price;
  final DateTime postedDate;

  FavoriteModel({
    required this.sellOrRent,
    required this.houseName,
    required this.location,
    required this.price,
    required this.postedDate,
  });
}
