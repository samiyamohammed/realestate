import 'package:real_estate_marketplace/models/favorite_model.dart';

enum FavoritesStatus { initial, success, failure }

class FavoritesState {
  FavoritesStatus status;
  List<FavoriteModel> favorites;

  FavoritesState({
    required this.status,
    required this.favorites,
  });

  List<FavoriteModel> _favorites = [];

  Future<void> addFavorite(FavoriteModel favorite) async {
    _favorites.add(favorite);
  }

  Future<void> removeFavorite(FavoriteModel favorite) async {
    _favorites.remove(favorite);
  }

  Future<List<FavoriteModel>> fetchFavorites() async {
    return _favorites;
  }
}
