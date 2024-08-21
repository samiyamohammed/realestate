import 'package:real_estate_marketplace/models/favorite_model.dart';

abstract class FavoritesEvent {}

class FetchFavorites extends FavoritesEvent {}

class AddFavorite extends FavoritesEvent {
  final FavoriteModel favorite;

  AddFavorite(this.favorite);
}

class RemoveFavorite extends FavoritesEvent {
  final FavoriteModel favorite;

  RemoveFavorite(this.favorite);
}
