import 'package:real_estate_marketplace/models/favorite_model.dart';

abstract class FavoritesEvent {}

class ToggleFavorite extends FavoritesEvent {
  final FavoriteModel favorite;

  ToggleFavorite(this.favorite);
}
