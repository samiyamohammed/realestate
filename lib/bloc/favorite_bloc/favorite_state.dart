// Initial state
import 'package:real_estate_marketplace/models/favorite_model.dart';

abstract class FavoriteState {}

class FavoritesInitialState extends FavoriteState {}

// Loading state
class FavoritesLoadingState extends FavoriteState {}

// Loaded state with the list of favorites
class FavoritesLoadedState extends FavoriteState {
  final List<FavoriteModel> favorites;

  FavoritesLoadedState({required this.favorites});
}

// Error state
class FavoritesErrorState extends FavoriteState {
  final String message;

  FavoritesErrorState({required this.message});
}
